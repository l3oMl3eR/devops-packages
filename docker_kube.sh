#!/bin/bash

echo "Ansible install"
apt update
apt install -y ansible

echo "Docker install"
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
echo 'deb [arch=amd64] https://download.docker.com/linux/debian buster stable' |
udo tee /etc/apt/sources.list.d/docker.list
apt update
apt install -y docker docker-compose docker.io
usermod -aG docker user
systemctl start docker

echo "Helm install"
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
apt install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
apt update
apt install -y helm

echo "Install kubernetes"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt update
apt install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl
