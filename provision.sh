#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt install nginx -y
sudo systemctl restart nginx
sudo systemctl enable nginx

# nodejs install
sudo apt-get install nodejs -y
sudo apt-get install python-software-properties -y
curl curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y

# pm2 install
sudo npm install pm2 -g

cd app
npm install
node app.js