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
    chsh -s /bin/zsh

RUN curl -fsSL https://starship.rs/install.sh | bash -s -- --yes && \
    echo 'eval "$(starship init zsh)"' > /config/.zshrc

# APT: Cleanup
RUN apt-get clean

# EXPOSE RUNTIME PORTS
EXPOSE 8443
