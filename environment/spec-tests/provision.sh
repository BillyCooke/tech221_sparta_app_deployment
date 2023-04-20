#!/bin/bash

sudo apt update
sudo apt upgrade
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927
echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt update
sudo apt upgrade
sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20
sudo systemctl start mongod

# provisioning mongodb config


sudo rm /etc/mongod.conf
sudo ln -s /vagrant/environment/mongod.conf /etc
sudo systemctl restart mongod
sudo systemctl enable mongod