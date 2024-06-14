#! /bin/sh

case "$1" in
    start)
        echo "Starting aesdsocket"
        ./aesdsocket > aesdsocket_log.txt 2>&1 &
        AESDSOCKET_PID=$!
        echo "aesdsocket PID: $AESDSOCKET_PID"
        ;;
    stop)
        echo "Stopping aesdsocket"

        # First, find and kill the aesdsocket process
        PIDS=$(pgrep -f "./aesdsocket")
        if [ -n "$PIDS" ]; then
            for PID in $PIDS; do
                kill -9 "$PID"
                echo "aesdsocket process (PID: $PID) stopped."
            done
        else
            echo "aesdsocket is not running."
        fi

        # Now, kill the script itself
        SCRIPT_PID=$(pgrep -f "./aesdsocket-start-stop.sh")
        if [ -n "$SCRIPT_PID" ]; then
            kill -9 "$SCRIPT_PID"
            echo "Script (PID: $SCRIPT_PID) stopped."
        else
            echo "Script is not running."
        fi
        ;;
    *)
        echo "Usage: $0 {start|stop}"
        exit 1
esac

exit 0
