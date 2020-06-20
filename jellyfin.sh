#!/bin/sh

if ! [ $(id -u) = 0 ]; then
    echo "Please run script as root"
    exit 1
fi

export DEBIAN_FRONTEND=noninteractive
apt update
apt install -y apt-transport-https gnupg2

wget -O - https://repo.jellyfin.org/jellyfin_team.gpg.key | apt-key add -
echo "deb [arch=$( dpkg --print-architecture )] https://repo.jellyfin.org/$( awk -F'=' '/^ID=/{ print $NF }' /etc/os-release ) $( awk -F'=' '/^VERSION_CODENAME=/{ print $NF }' /etc/os-release ) main" | tee /etc/apt/sources.list.d/jellyfin.list
apt update
apt install -y jellyfin