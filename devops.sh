#!/bin/bash

echo "Update last version packages and install the needed packages admin, devops"

apt update
#apt full-upgrade -y

apt install -y curl wget apt-transport-https \
    pwgen mc net-tools nmap iptraf nmon nano \
    git jnettop htop iotop iftop
