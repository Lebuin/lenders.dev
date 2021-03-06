#!/bin/bash

# Install docker
apt update
apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"
apt update
apt install -y docker-ce docker-ce-cli containerd.io

# Install docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install haveged to make sure the server generates enough entropy.
# This was necessary on DigitalOcean, probably not on OVH.
apt install -y haveged


# Add the current user to the docker group to enable rootless docker access and reboot
usermod -aG docker $USER
reboot
