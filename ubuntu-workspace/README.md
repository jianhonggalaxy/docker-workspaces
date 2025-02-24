
  

# Ubuntu Systemd Docker Container

  

This project provides a Docker container that behaves like a full Ubuntu VM, complete with `systemd`, `zsh`, and common utilities.

  

## Features

  

✅ Fully working `systemd` inside Docker

✅ Runs in the background like a VM

✅ Allows `docker exec` for interactive access

✅ Supports `cron`, `dbus`, `zsh`, and other system services

✅ Auto-restarts on system reboot (optional)

  
  

## 📌 Prerequisites

  

- Install **Docker** (if not already installed):

```sh

sudo apt update && sudo apt  install  -y  docker.io

  

```

  

- Ensure Docker is running:

```sh

sudo systemctl start docker

sudo systemctl enable docker

```

  

## 🚀 How to Build and Run the Container

  

### 1️⃣ Build the Docker Image

  

Run the following command to build the image:

  

```sh

docker build  -t  ubuntu-workspace  .

  

```

  

### 2️⃣ Run the Container Like a VM

  

Start the container in the background:

  

```sh

docker run  -d  --privileged  --name  workspace  ubuntu-workspace

  

```

  

- The `--privileged` flag allows systemd to manage services inside the container.

- The container will now stay **running in the background**.

  

### 3️⃣ Connect to the Running Container

  

To enter the container, use:

  

```sh

docker exec  -it  workspace  /bin/bash

  

```

  

Or, if using `zsh`:

  

```sh

docker exec  -it  workspace  /bin/zsh

  

```

  

### 4️⃣ Auto-Restart on Boot

  

If you want the container to restart automatically on system reboot, run:

  

```sh

docker run  -d  --privileged  --name  workspace  --restart  unless-stopped  ubuntu-workspace

  

```

  

----------

  

## 🛠 Useful Commands

  

### Check Running Containers

  

```sh

docker ps

  

```

  

### Stop the Container

  

```sh

docker stop  workspace

  

```

  

### Start the Container Again

  

```sh

docker start  workspace

  

```

  

### Restart the Container

  

```sh

docker restart  workspace

  

```

  

### Remove the Container

  

To completely remove the container:

  

```sh

docker rm  -f  workspace

  

```

  

----------

  

## 🐞 Troubleshooting

  

### 1️⃣ systemd Does Not Work

  

Ensure the container is started with `--privileged`:

  

```sh

docker run  -d  --privileged  --name  workspace  ubuntu-workspace

  

```

  

### 2️⃣ Package Not Found (`E: Unable to locate package...`)

  

If you see errors while installing packages, try rebuilding the image:

  

```sh

docker build  --no-cache  -t  ubuntu-workspace  .

  

```

  

### 3️⃣ Container Stops Unexpectedly

  

Check logs for errors:

  

```sh

docker logs  ubuntu-workspace

  

```

  

### 4️⃣ Docker Permission Issues

  

If running `docker` requires `sudo`, add your user to the `docker` group:

  

```sh

sudo usermod  -aG  docker $USER

newgrp docker

  

```

  

----------

  

## 🎉 Enjoy Your Ubuntu VM-Like Docker Container!

  

This setup makes Docker behave like a full VM, complete with systemd and common utilities. 🚀 Happy hacking! 🖥️🎯
