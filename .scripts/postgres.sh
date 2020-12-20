#!/bin/sh
sudo touch /etc/apt/sources.list.d/pgdg.list
sudo echo 'deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main' >> /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt update
yes Y | sudo aptinstall postgresql-client-10
