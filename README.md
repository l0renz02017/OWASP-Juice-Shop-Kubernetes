# OWASP-Juice-Shop-Kubernetes
This repository contains the instructions and yaml files to launch OWASP Juice Shop vulnerable website for learning web application pentesting and it is deployed on Kubernetes.

Step 1: Install Linux. I using Kali Linux VM 2024.2 version. This tutorial assumes you know how to spin up the VM.

Step 2: Install Docker using the following command

#apt install docker.io
└─# docker version
Client:
 Version:           20.10.25+dfsg1

Step 3: Install Kind (easy to install Kubernetes distro)

Copy and paste the lines 15 to 20 and paste into your terminal
# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.23.0/kind-linux-amd64
# For ARM64
[ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.23.0/kind-linux-arm64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

