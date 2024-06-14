#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <errno.h>
#include <syslog.h>
#include <signal.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <netdb.h>
#include <netinet/in.h>

#define SOCKET_FAIL -1
#define RET_OK 0

char *pcDataFilePath = "/var/tmp/aesdsocketdata";
FILE *pfDataFile = NULL;

#define BACKLOG 10
char *pcPort = "9000";
struct addrinfo *servinfo = NULL;
int sfd = 0;
int sockfd = 0;

#define RECV_BUFF_SIZE 1024
#define READ_BUFF_SIZE 1024

void exit_cleanup(void)
{
    if (pfDataFile != NULL)
    {
        fclose(pfDataFile);
        unlink(pcDataFilePath);
    }

    if (sfd >= 0)
    {
        close(sfd);
    }

    if (sockfd >= 0)
    {
        close(sockfd);
    }
}

void sig_handler(int signo, siginfo_t *info, void *context)
{
    int errno_saved = errno;

    if (signo == SIGINT)
    {
        syslog(LOG_DEBUG, "Caught signal SIGINT, exiting");
        printf("Caught SIGINT\n");
    }
    else if (signo == SIGTERM)
    {
        syslog(LOG_DEBUG, "Caught signal SIGTERM, exiting");
        printf("Caught SIGTERM\n");
    }
    errno = errno_saved;
    exit_cleanup();
    exit(EXIT_SUCCESS);
}

void do_exit(int exitval)
{
    exit_cleanup();
    exit(exitval);
}

int setup_signals(void)
{
    struct sigaction sSigAction = {0};

    sSigAction.sa_sigaction = &sig_handler;
    if (sigaction(SIGINT, &sSigAction, NULL) != 0)
    {
        perror("Setting up SIGINT");
        return errno;
    }
    if (sigaction(SIGTERM, &sSigAction, NULL) != 0)
    {
        perror("Setting up SIGTERM");
        return errno;
    }

    return RET_OK;
}

int setup_datafile(void)
{
    if ((pfDataFile = fopen(pcDataFilePath, "w+")) == NULL)
    {
        perror("fopen");
        printf("Error opening: %s\n", pcDataFilePath);
        return errno;
    }

    return RET_OK;
}

int setup_socket(void)
{
    struct addrinfo hints;
    int yes = 1;

    memset(&hints, 0, sizeof hints);
    hints.ai_family = AF_INET;
    hints.ai_socktype = SOCK_STREAM;
    hints.ai_flags = AI_PASSIVE;

    if ((getaddrinfo(NULL, pcPort, &hints, &servinfo)) != 0)
    {
        perror("getaddrinfo");
        return errno;
    }

    if ((sfd = socket(servinfo->ai_family, servinfo->ai_socktype, servinfo->ai_protocol)) < 0)
    {
        perror("socket");
        return errno;
    }

    if (setsockopt(sfd, SOL_SOCKET, SO_REUSEADDR, &yes, sizeof(int)) < 0)
    {
        perror("setsockopt");
        return errno;
    }

    if (bind(sfd, servinfo->ai_addr, servinfo->ai_addrlen) < 0)
    {
        perror("bind");
        return errno;
    }

    freeaddrinfo(servinfo);

    if (listen(sfd, BACKLOG) < 0)
    {
        perror("listen");
        return errno;
    }

    return RET_OK;
}

int file_send(void)
{
    fseek(pfDataFile, 0, SEEK_SET);
    char acReadBuff[READ_BUFF_SIZE];
    size_t bytesRead = 0;
    while ((bytesRead = fread(acReadBuff, 1, sizeof(acReadBuff), pfDataFile)) > 0)
    {
        if (send(sockfd, acReadBuff, bytesRead, 0) < 0)
        {
            perror("send");
            return errno;
        }
    }

    if (ferror(pfDataFile) != 0)
    {
        perror("read");
        return errno;
    }

    return RET_OK;
}

int file_write(void *buff, int size)
{
    fseek(pfDataFile, 0, SEEK_END);
    fwrite(buff, size, 1, pfDataFile);
    if (ferror(pfDataFile) != 0)
    {
        perror("write");
        return errno;
    }

    return RET_OK;
}

int daemonize(void)
{
    umask(0);

    pid_t pid;
    if ((pid = fork()) < 0)
    {
        perror("fork");
        return errno;
    }
    else if (pid != 0)
    {
        exit(EXIT_SUCCESS);
    }

    if (setsid() < 0)
    {
        perror("setsid");
        return errno;
    }

    if (chdir("/") < 0)
    {
        perror("chdir");
        return errno;
    }

    int dev_null_fd = open("/dev/null", O_RDWR);
    if (dev_null_fd < 0)
    {
        perror("open /dev/null");
        return errno;
    }
    dup2(dev_null_fd, STDIN_FILENO);
    dup2(dev_null_fd, STDOUT_FILENO);
    dup2(dev_null_fd, STDERR_FILENO);

    if (dev_null_fd > STDERR_FILENO)
        close(dev_null_fd);

    return RET_OK;
}
int main(int argc, char **argv)
{
    int iDeamon = false;
    int iRet = 0;

    openlog(NULL, 0, LOG_USER);

    if ((argc > 1) && strcmp(argv[1], "-d") == 0)
    {
        iDeamon = true;
    }

    if ((iRet = setup_signals()) != 0)
    {
        do_exit(iRet);
    }

    if ((iRet = setup_datafile()) != 0)
    {
        do_exit(iRet);
    }

    if (setup_socket() != 0)
    {
        do_exit(SOCKET_FAIL);
    }

    if (iDeamon)
    {
        printf("Demonizing, listening on port %s\n", pcPort);
        if ((iRet = daemonize()) != 0)
        {
            do_exit(iRet);
        }
    }
    else
    {
        printf("Waiting for connections...\n");
    }

    while (1)
    {
        struct sockaddr_storage their_addr;
        socklen_t addr_size = sizeof their_addr;
        if ((sockfd = accept(sfd, (struct sockaddr *)&their_addr, &addr_size)) < 0)
        {
            perror("accept");
            sleep(1);
            continue;
        }

        struct sockaddr_in *sin = (struct sockaddr_in *)&their_addr;
        unsigned char *ip = (unsigned char *)&sin->sin_addr.s_addr;
        syslog(LOG_DEBUG, "Accepted connection from %d.%d.%d.%d\n", ip[0], ip[1], ip[2], ip[3]);

        int iReceived = 0;
        char acRecvBuff[RECV_BUFF_SIZE];
        while (1)
        {
            iReceived = recv(sockfd, &acRecvBuff, sizeof(acRecvBuff) - 1, 0);
            if (iReceived < 0)
            {
                perror("recv");
                do_exit(errno);
            }
            else if (iReceived == 0)
            {
                close(sockfd);
                syslog(LOG_DEBUG, "Closed connection from %d.%d.%d.%d\n", ip[0], ip[1], ip[2], ip[3]);
                break;
            }
            else if (iReceived > 0)
            {
                acRecvBuff[iReceived] = '\0'; // Ensure null-terminated string
                printf("Received from client: %s\n", acRecvBuff);
                syslog(LOG_DEBUG, "Received from client: %s\n", acRecvBuff);

                char *pcEnd = strstr(acRecvBuff, "\n");
                if (pcEnd == NULL)
                {
                    int ret = 0;
                    if ((ret = file_write(acRecvBuff, iReceived)) != 0)
                    {
                        do_exit(ret);
                    }
                }
                else
                {
                    int ret = 0;
                    if ((ret = file_write(acRecvBuff, (int)(pcEnd - acRecvBuff + 1))) != 0)
                    {
                        do_exit(ret);
                    }

                    if ((ret = file_send()) != 0)
                    {
                        do_exit(ret);
                    }
                }
            }
        }
    }

    do_exit(RET_OK);
}
