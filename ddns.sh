#!/bin/sh

if ! [ $(id -u) = 0 ]; then
    echo "Please run script as root"
    exit 1
fi

VERSION="0.0.1"

export DEBIAN_FRONTEND=noninteractive
apt update
apt install -y wget

cd /tmp || (mkdir /tmp && cd /tmp)
wget -c https://github.com/ChenTanyi/ddns/releases/download/v${VERSION}/ddns_linux_amd64
mv ddns_linux_amd64 /usr/bin/ddns