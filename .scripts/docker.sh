#!/bin/sh
# install docker using convenience script
# https://docs.docker.com/install/linux/docker-ce/ubuntu/
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
# install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Use docker without sudo
sudo usermod -aG docker $(whoami)
