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
#include <arpa/inet.h>

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

/* Cleanup function */
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

/* Signal handler */
void sig_handler(int signo)
{
    if (signo == SIGINT || signo == SIGTERM)
    {
        syslog(LOG_DEBUG, "Caught signal, exiting");
        exit_cleanup();
        exit(EXIT_SUCCESS);
    }
}

/* Setup signal handlers */
int setup_signals(void)
{
    struct sigaction act;
    memset(&act, 0, sizeof(act));
    act.sa_handler = sig_handler;

    if (sigaction(SIGINT, &act, NULL) < 0)
    {
        perror("sigaction");
        return errno;
    }
    if (sigaction(SIGTERM, &act, NULL) < 0)
    {
        perror("sigaction");
        return errno;
    }

    return RET_OK;
}

/* Open and prepare data file */
int setup_datafile(void)
{
    pfDataFile = fopen(pcDataFilePath, "a+");
    if (pfDataFile == NULL)
    {
        perror("fopen");
        return errno;
    }
    return RET_OK;
}

/* Setup socket */
int setup_socket(void)
{
    struct addrinfo hints, *p;
    int yes = 1;

    memset(&hints, 0, sizeof hints);
    hints.ai_family = AF_INET;
    hints.ai_socktype = SOCK_STREAM;
    hints.ai_flags = AI_PASSIVE;

    if (getaddrinfo(NULL, pcPort, &hints, &servinfo) != 0)
    {
        perror("getaddrinfo");
        return errno;
    }

    for (p = servinfo; p != NULL; p = p->ai_next)
    {
        if ((sfd = socket(p->ai_family, p->ai_socktype, p->ai_protocol)) < 0)
        {
            perror("socket");
            continue;
        }

        if (setsockopt(sfd, SOL_SOCKET, SO_REUSEADDR, &yes, sizeof(int)) < 0)
        {
            perror("setsockopt");
            return errno;
        }

        if (bind(sfd, p->ai_addr, p->ai_addrlen) < 0)
        {
            close(sfd);
            perror("bind");
            continue;
        }

        break;
    }

    freeaddrinfo(servinfo);

    if (p == NULL)
    {
        fprintf(stderr, "Failed to bind\n");
        return SOCKET_FAIL;
    }

    if (listen(sfd, BACKLOG) < 0)
    {
        perror("listen");
        return errno;
    }

    return RET_OK;
}

/* Handle client connection */
void handle_client(int client_fd)
{
    char recv_buff[RECV_BUFF_SIZE];
    ssize_t bytes_received;

    while ((bytes_received = recv(client_fd, recv_buff, sizeof(recv_buff), 0)) > 0)
    {
        fwrite(recv_buff, 1, bytes_received, pfDataFile);

        // Check for end of message (newline character)
        if (memchr(recv_buff, '\n', bytes_received) != NULL)
        {
            fseek(pfDataFile, 0, SEEK_SET);
            char read_buff[READ_BUFF_SIZE];
            size_t bytes_read;

            while ((bytes_read = fread(read_buff, 1, sizeof(read_buff), pfDataFile)) > 0)
            {
                if (send(client_fd, read_buff, bytes_read, 0) < 0)
                {
                    perror("send");
                    break;
                }
            }
            fseek(pfDataFile, 0, SEEK_END);
        }
    }

    if (bytes_received == 0)
    {
        syslog(LOG_DEBUG, "Closed connection from client\n");
    }
    else if (bytes_received < 0)
    {
        perror("recv");
    }

    close(client_fd);
}

/* Main function */
int main(int argc, char **argv)
{
    int iDaemon = 0;
    openlog(NULL, 0, LOG_USER);

    if (argc > 1 && strcmp(argv[1], "-d") == 0)
    {
        iDaemon = 1;
    }

    if (setup_signals() != RET_OK)
    {
        exit(EXIT_FAILURE);
    }

    if (setup_datafile() != RET_OK)
    {
        exit(EXIT_FAILURE);
    }

    if (setup_socket() != RET_OK)
    {
        exit(EXIT_FAILURE);
    }

    if (iDaemon)
    {
        daemon(1, 0);
    }

    while (1)
    {
        struct sockaddr_storage client_addr;
        socklen_t addr_size = sizeof(client_addr);
        int client_fd = accept(sfd, (struct sockaddr *)&client_addr, &addr_size);
        if (client_fd < 0)
        {
            perror("accept");
            continue;
        }

        char client_ip[INET_ADDRSTRLEN];
        struct sockaddr_in *sin = (struct sockaddr_in *)&client_addr;
        inet_ntop(AF_INET, &sin->sin_addr, client_ip, sizeof(client_ip));
        syslog(LOG_DEBUG, "Accepted connection from %s\n", client_ip);

        handle_client(client_fd);
    }

    exit(EXIT_SUCCESS);
}
