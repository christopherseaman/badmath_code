FROM linuxserver/code-server:amd64-latest
# ARG DOCKER_HOST_GID
# ARG DEFAULT_USER
ENV PASSWORD=$CODE_PASSWORD
ENV SUDO_PASSWORD=$SUDO_PASSWORD

COPY config /config

# Update: System Packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt install -y dialog apt-utils && \
    apt install -y ansible apt-transport-https build-essential ca-certificates chromium-browser ffmpeg gnupg-agent htop iputils-ping libffi-dev libssl-dev python3 python3-dev python3-pip jupyter ranger software-properties-common sshpass systemd tree unzip vim wget youtube-dl

# NPM: Packages
# RUN npm install -g webpack-cli create-react-app gatsby gulp netlify-cli

# Shell: ZSH
RUN apt install -y zsh && \
    chmod +x ./install_zsh.sh && \
    ZSH=~/.zsh && \
    ./install_zsh.sh --unattended && \
    chsh -s /bin/zsh

# Homebrew
RUN mkdir /home/linuxbrew /config/.cache/Homebrew /config/.config/git && \
    touch /config/.profile && \
    chown -R $DEFAULT_USER:$DEFAULT_USER /home/linuxbrew /config/.cache/Homebrew /config/.config/git /config/.profile

USER $DEFAULT_USER
RUN yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
    echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /config/.profile && \
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv) && \
    brew tap git-time-metric/gtm && \
    brew install gtm starship

# SEC: ClamAV
RUN apt install -y clamav clamav-daemon && \
    freshclam

# SEC: Hosts
RUN wget https://someonewhocares.org/hosts/hosts -O /etc/hosts

# APT: Cleanup
RUN apt-get clean

# EXPOSE RUNTIME PORTS
EXPOSE 8443
# 5000-5010 8000-8010