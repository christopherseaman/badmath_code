FROM linuxserver/code-server:amd64-latest

COPY config /config

# Update: System Packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt install -y dialog apt-utils python3 python3-pip fuse 
    # jupyter

# Shell: Starship on BASH
RUN curl -fsSL https://starship.rs/install.sh | bash -s -- -y

# APT: Cleanup
RUN apt-get clean

# EXPOSE RUNTIME PORTS
EXPOSE 8443
