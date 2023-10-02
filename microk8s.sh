#!/bin/bash


SSH_SERVER="10.95.0.245"
SSH_USER="root"
SSH_PASSWORD="P@ssw0rd"
#SSH_PASSWORD="DevOps@#2023"

echo -e "\e[1;34mConnect to $SSH_SERVER\e[0m"
CONNECT_SSH="sshpass -p $SSH_PASSWORD ssh -q -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $SSH_USER@$SSH_SERVER"
$CONNECT_SSH "sudo dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm"
$CONNECT_SSH "sudo yum install -y snapd"
$CONNECT_SSH "sudo systemctl enable --now snapd.socket"
$CONNECT_SSH "sudo ln -s /var/lib/snapd/snap /snap"
$CONNECT_SSH "sleep 60"
$CONNECT_SSH "sudo snap install microk8s --classic"
$CONNECT_SSH "export PATH=$PATH:/snap/bin"
$CONNECT_SSH "microk8s status --wait-ready"
$CONNECT_SSH "microk8s enable dns"
$CONNECT_SSH "microk8s enable hostpath-storage"
$CONNECT_SSH "sudo snap install kubectl --classic"
$CONNECT_SSH "microk8s config > ~/.kube/config"
$CONNECT_SSH "microk8s kubectl get nodes"
$CONNECT_SSH "microk8s.kubectl config view --raw > $HOME/.kube/config"

