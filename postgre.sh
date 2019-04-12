sudo touch /etc/apt/sources.list.d/pgdg.list
echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main"  | sudo tee -a /etc/apt/sources.list.d/pgdg.list > /dev/null
echo 'text' | sudo tee -a /file.txt
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt update
sudo apt install postgresql-10 postgresql-client-10

