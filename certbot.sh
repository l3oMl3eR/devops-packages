#!/bin/bash

### CERTBOT INSTALL:

apt update
apt install -y wget curl git mc nano \
    snap python3-dev python3-venv gcc \
    libaugeas0 libssl-dev libffi-dev \
    ca-certificates openssl nginx \
    --no-install-recommends

apt-get clean
git clone https://github.com/certbot/certbot.git

snap install core; snap refresh core
snap install --classic certbot

# Start certbot
#certbot --nginx
