#!/bin/sh

if ! [ $(id -u) = 0 ]; then
    echo "Please run script as root"
    exit 1
fi

VERSION="0.33.0"

export DEBIAN_FRONTEND=noninteractive
apt update
apt install -y wget tar

cd /tmp || (mkdir /tmp && cd /tmp)
wget -c https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_amd64.tar.gz
tar zxf frp_${VERSION}_linux_amd64.tar.gz
mv frp_${VERSION}_linux_amd64/frpc /usr/bin/
mv frp_${VERSION}_linux_amd64/frps /usr/bin/
rm -rf frp_${VERSION}_linux_amd64 frp_${VERSION}_linux_amd64.tar.gz