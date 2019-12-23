#!/bin/sh

if ! [ $(id -u) = 0 ]; then
    echo "Please run script as root"
    exit 1
fi

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y install lsb-release

# Uninstall old versions
apt-get -y remove docker docker-engine docker.io containerd runc

# Install using the repository
apt-get update
apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common
curl -fsSL https://download.docker.com/linux/`awk -F'=' '/^ID=/{ print $NF }' /etc/os-release`/gpg | apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/`awk -F'=' '/^ID=/{ print $NF }' /etc/os-release` \
   $(lsb_release -cs) \
   stable"

apt-get update
apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose
