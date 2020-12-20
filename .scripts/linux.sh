#!/bin/sh
sudo apt-get update -y
sudo apt-get install -y aptitude 
sudo aptitude install -y neovim git curl flatpak build-essential openssl libssl-dev fish
# If dual boot
# timedatectl set-local-rtc 1 --adjust-system-clock
