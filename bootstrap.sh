#!/bin/sh
# Assumes Debian-based

# Update and deps
apt-get update

apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common


# Docker
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose



# Caddy
apt install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/cfg/gpg/gpg.155B6D79CA56EA34.key' | apt-key add -
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/cfg/setup/config.deb.txt?distro=debian&version=any-version' | tee -a /etc/apt/sources.list.d/caddy-stable.list
apt update
apt install -y caddy

cp code-server/Caddyfile /etc/caddy/Caddyfile

# Compose code-server
docker-compose -f code-server/docker-compose.yaml up --detach


#DEBUG sudo -H SUDO_PASSWORD=$SUDO_PASSWORD CODE_PASSWORD=$CODE_PASSWORD docker-compose -f code-server/docker-compose.yaml up --detach
