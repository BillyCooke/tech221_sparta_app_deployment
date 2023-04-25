# Two tier architecture deployment

## How to copy your app to you AWS instance

1. First you need to launch a new instance on AWS and name is appropriately. Mine was named billy-tech221-app
2. Follow the normal steos of launching an instance by selecting an AMI and the key pair
3. In network settings we can select an existing security group or make a new one. Either way we need to add port 3000 to it
4. In user data we can enter our previosuly made provision script so that when the onstance is launched Nginx, nodejs, pm2 and npm are already installed
5. Next click lanuch and wait for it to apss the checks
6. Now we need to ssh into the instance
7. Select the instance and click connect
8. In Git Bash you need to cd into the .ssh file using ```cd .ssh```
9. Use the bottom command on the connect page in AWS and that into the Git Bash terminal
10. If we didn't use the provision script earlier than we need to use the following commands to install Nginx
11. sudo apt update -y
12. sudo apt upgrade -y
13. sudo apt install nginx -y
14. sudo systemctl status nginx
15. Next we need to copy everything from our local terminal to AWS
16. Open a new terminal in GIt Bash and run this code ```scp -i "tech221.pem" -r C:\Users\billy\Sparta\tech221_virtualisation\app ubuntu@ec2-34-255-121-128.eu-west-1.compute.amazonaws.com:/home/ubuntu/```
17. The last part ```ubuntu@ec2-34-255-121-128.eu-west-1.compute.amazonaws.com:/home/ubuntu/``` will be different and you will find this in the AWS connect page. It is the bottom command but you copy from where ```ubuntu starts``` and then add ```/home/ubuntu/``` on the end to state where to copy it to
18. Now go back to your previous terminal and install nodejs using the following
19. ```sudo apt-get install python-software-properties```
20. ```curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -```
21. ```sudo apt-get install nodejs -y```
22. Now to install pm2 use ```sudo npm install pm2 -g```
23. To start the app run ```node app.js```
24. The app is now running but if we want to access the database we need to run a MongoDB instance as well. Use the steps below

## MongoDB instance
1. Create a new instance on AWS and name appropriately again. Mine was names billy-tech221-db
2. Follow all the normal steps however in security group we need to allow MYIP, port 27017 and port 3000
3. Launch the instance and open a new Git Bash terminal
4. cd into the .ssh folder
5. Use the command from the connect page in the db instance to ssh into the instance on Git Bash
6. Now we need to install MongoDB using the following
7. ```sudo apt update -y```
8. ```sudo apt upgrade -y```
9. ```sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927```
10. ```echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list```
11. ```sudo apt update -y```
12. ```sudo apt upgrade -y```
13. ```sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20```
14. ```sudo systemctl start mongod```
15. ```sudo systemctl status mongod```
16. Change your directory to ```cd /etc/``` and open the MongodB config file using ```sudo nano /etc/mongod.conf```
17. Scroll to the bottom under network and change the bindtp to 0.0.0.0
18. Use ctrl x, press y and then enter to save
19. To implement this change we need to restart MongoDB using ```sudo systemctl restart mongod```
20. Then restart is using ```sudo systemctl enable mongod```
21. We can check to see if it is working using ```sudo systemctl status mongod```
22. 