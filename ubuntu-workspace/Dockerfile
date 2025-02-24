FROM ubuntu:24.04

# Set environment variables for noninteractive installations
ENV DEBIAN_FRONTEND=noninteractive
ENV container=docker

# Install systemd and necessary dependencies
RUN apt-get update && apt-get install -y \
    systemd systemd-sysv dbus dbus-user-session \
    sudo jq git curl wget \
    netcat-traditional dnsutils zip gzip tar \
    acl psmisc tzdata openssl \
    python3-pip python3-setuptools python-is-python3 \
    yarn cron nano vim mc tmux ncdu htop \
    && rm -rf /var/lib/apt/lists/*

# Ensure proper timezone configuration
RUN ln -fs /usr/share/zoneinfo/Asia/Singapore /etc/localtime && \
    apt-get install --reinstall -y tzdata && rm -rf /var/lib/apt/lists/*

# Create user 'abc' with sudo access
RUN useradd -m -s /bin/bash -u 8877 abc && \
    echo "abc ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Enable systemd services (fixes systemctl issues in Docker)
RUN mkdir -p /etc/systemd/system/getty@tty1.service.d && \
    echo '[Service]\nExecStart=\nExecStart=-/sbin/agetty --noclear %I $TERM' > /etc/systemd/system/getty@tty1.service.d/override.conf && \
    systemctl set-default multi-user.target

# Install and configure ZSH
RUN apt-get update && apt-get install -y software-properties-common && \
    add-apt-repository universe && \
    apt-get update && apt-get install -y zsh && \
    chsh -s /bin/zsh abc

# Install Docker inside the container (if needed for nested Docker)
RUN apt-get install -y docker.io && \
    usermod -aG docker abc

# Clean up temporary files and set permissions
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set the entrypoint to systemd
CMD ["/sbin/init"]
