#!/bin/bash

CONTAINER_NAME="workspace"
IMAGE_NAME="ubuntu-workspace:24.04"

case "$1" in
    start)
        echo "Starting container..."
        docker run -d --privileged --name $CONTAINER_NAME --restart unless-stopped $IMAGE_NAME
        ;;
    stop)
        echo "Stopping container..."
        docker stop $CONTAINER_NAME
        ;;
    restart)
        echo "Restarting container..."
        docker restart $CONTAINER_NAME
        ;;
    status)
        docker ps | grep $CONTAINER_NAME
        ;;
    exec)
        echo "Executing shell in container..."
        docker exec -it $CONTAINER_NAME /bin/bash
        ;;
    build)
        echo "Building docker container locally..."
        docker build -t $CONTAINER_NAME .
        ;;
    remove)
        echo "Removing container..."
        docker rm -f $CONTAINER_NAME
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|status|exec|remove}"
        exit 1
        ;;
esac