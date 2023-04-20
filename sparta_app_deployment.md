# Deploying an app using Vagrant
When we are passed a folder for an app by developers we first want to do the following steps. In this example we were sent two folders, "app" and "environment".
1. Download the folders
2. If the folder is in a zip fodler we will need to unzip it
3. To unzip, right click on the folder and select extract. This may take some time
4. Then move the folders from your downloads to the same directory that your vagrant file is in
5. In VS go into your vagrant file and use the following code ```config.vm.synced_folder "app", "/home/vagrant/app"```. It should then look like this.

![Alt text](Vagrant%20code%20for%20Sparta%20app.png)

6. Next go into Git Bash and cd into the same directory as your vagrant file. For example mine is.

![Alt text](VS%20vagrant%20directory.png)

7. Use ```vagrant ssh``` to go into vagrant
8. To check that the app is in the right folder use ```ls``` and you should see this

![Alt text](Vagrant%20ls.png)

9. Then go into the file using ```cd app```
10. Again use ```ls``` to check what is in the file
11. Now we need to go into our environment folder in VS
12. Use the terminal to enter ```cd environment```. Make sure you are in the location of your vagrant file before doing this

![Alt text](VS%20vagrant%20directory.png)

13. Then use ```cd spec-tests/``` to go into that file
14. Now we want to run the command ```gem install bundler```
15. Then use ```bundle```. This make take some time
16. After that is done we can run the command ```rake spec``` which will show us all the packages that are needed for the app and if we have them installed or not
17. If they are all installed then you just need to run the code ```node app.js```
18. Then copy the IP address in your vagrant file and paste it into a url but add the port ```:3000``` at the end of it
19. If everything works the app screen should load up
20. If more packages were needed to be installed then refer to the below

## Downloading packages in vagrant for Sparta App
As mentioned above if after running ```rake spec``` you need to install some further packages then follow the below. In this example I needed to install nodejs version 6.x and pm2.
1. In Git Bash whilst in vagrant use ```cd``` to go back to the home directory
2. Use the command ```sudo apt-get install nodejs -y``` and press enter
3. Then use ```sudo apt-get install python-software-properties```
4. After that run ```curl -sL https://deb.nodesource.com/setup_6.x | sudo - bash - ```
5. After that has loaded use ```sudo apt-get install nodejs -y```
6. The reason we have run this command twice, once at step 2 and then at step 5, is because the first command installed nodejs and the second command installed version 6.x
7. Once it has installed use ```nodejs --version``` to check you have the correct version. It should be as below
![Alt text](Vagrant%20nodejs%20version.png)

8. Next we want to install pm2
9. We carry straight on from before and use the command ```sudo npm install pm2 -g```. NPM stands for node package manager
10. Once that is done we want to go into the app folder using ```cd app```
11. Then use the command ```npm install```
12. Then you just need to run the code ```node app.js```
13. Copy the IP address in your vagrant file and paste it into a url but add the port ```:3000``` at the end of it
14. If everything works the app screen should load up

## To automate installing the applications use the following
1. Add the following commands to your shell script

```# nodejs install```

```sudo apt-get install nodejs -y```

```sudo apt-get install python-software-properties -y```

```curl curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -sudo apt-get install nodejs -y```

```# pm2 install```

```sudo npm install pm2 -g```

```cd app```

```npm install```

```node app.js```

2. It should look like this

![Alt text](Shell%20script.png)

3. Now all you have to do is run the command ```vagrant up``` in VS and enter ```192.168.10.100:3000``` into a browser and the sparta app will run

## How to run two VM's in the same Vagrant file

1. We need to name our original VM so that it does not get confused.
2. This is our original code which we have now changed
![Alt text](VM%20app.png)
3. In the above we have change our original code from default to app
4. We need to ensure there is an indent under ```config.vm.defibe "app" do |app|```
5. Next we can add a new VM called ```db```
6. We need to add the below code

![Alt text](db%20vm.png)

7. The only changes from the ```app``` code is that this one is named ```db``` and we need to change the IP address. We have kept it in the same range but changed it slightly


## How to add MongoDB to our VM via provisioning
We want to add this to our db VM that we just made so we need to follow the below
1. In VS code we want to make a new shell script in a seperate location and I chose the environment folder.
2. In the folder add a new file called provision.sh
3. Add the below codes

```#!/bin/bash```

```sudo apt update```

```sudo apt upgrade```

```sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927```

```echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list```

```sudo apt update```

```sudo apt upgrade```

```sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20```

```sudo systemctl start mongod```

4. Then back in your vagrant file you need to add the following command

```db.vm.provision "shell", path: "C:/Users/billy/Sparta/tech221_virtualisation/environment/spec-tests/provision.sh"```

5. It should now look like this

![Alt text](MongoDB%20vm%20code.png)

6. The command above is first telling vagrant that we want to pull from a shell script but then we need to provide it with the path. In my example I right clicked on the shell file in environment and copied the path.
7. Then in the VS terminal run ```vagrant up db``` as we only want to run db and not app as well
8. After this has all loaded go into your Git Bash and run ```vagrant ssh db``` again we are stating which VM to ssh into
9. Then use the command ```sudo systemctl status mongod``` to check it mongod has installed
10. If you see the same message as below then it has installed properly

![Alt text](MongoDB%20status.png)

## Running a process as a background process
When we run our vm app we get locked out of the terminal so below is a way to stop that and turn thr process into a background process.
1. Go into your shell file provision.sh
2. Change the last few commands by adding ```&``` at the end
3. This should look like the below

![Alt text](Background%20process.png)

## Connecting our database to our app
1. First we want to change our vagrant file slightly
2. We want to change ```app.vm.box``` and ```db.vm.box``` to ```app.vm.box = "ubuntu/bionic64"``` and ```db.vm.box = "ubuntu/bionic64"```
3. They both previosuly had ```xenial64``` but we have changed it to ```bionic64```
4. Next we need to ```vagrant up``` in VS to launch both VM's
5. When they are both up and running we need to open two Git Bash terminals
6. Then use ```vagrant ssh app``` in one and ```vagrant ssh db``` in the other
7. In the app terminal we just want to make sure we have ```nodejs``` and ```pm2``` installed properlly
8. We use ```nodejs --version``` then enter and then ```pm2 --version``` to check both of these
9. In the db terminal we need to check mongod is running so we use ```sudo systemctl status mongod```
10. Next we need to change the configuration of mongodb by using ```sudo nano /etc/mongod.conf```
11. This will bring up the file and we need to go right to the bottom
12. In network interfaces we need to change the ```bindIP``` to ```0.0.0.0```
13. Use ctrl x, press y and then enter to save and exit
14. To implement the changes we need to use ```sudo systemctl restart mongod```
15. Then to start the mongod use ```sudo systemctl enable mongod```
16. After this use ```sudo systemctl status mongod``` just to check everything is working
17. Use control z to exit that
18. Now we need to go into the app terminal
19. We use ```sudo nano .bashrc``` which will bring up a file and  we need to go to the bottom underneath eveything else
20. We then write ```export DB_HOST=mongodb://192.168.10.150:27017/posts```
21. A break down of the above code is we use export to define the variable, DB_HOST was already given to use to use by the Dev team, the IP address is the same we already entered in our vagrant file, 27017 is the default MongoDB port and posts is the page that the Dev team passed us
22. Use ctrl x, press y and then enter to save and exit
23. We now need to refresh the file using ```source .bashrc```
24. We can use ```printenv DB_HOST``` to show us the variable we created
25. Now we need to go into the location of our app using ```cd app```
26. Then install npm using ```npm install```
27. After it has installed use ```node seeds/seed.js``` to run the file to seed the database
28. Then start the app using ```node app.js```
29. Now we go into a browser and enter ```192.168.10.100:3000/posts``` which should bring up the Sparta posts page

## How to provision changing the Mongod.conf
1. Go into your shell script for your db file
2. We first need to make a new conf file with the changed input. I made a new file in VS called mongod.conf and plavced it in the same directory as my vagrant file
3. I then copied over everything that was in the original file but changed the ```bindIP``` to ```0.0.0.0```
4. We then need to remove the conf file and replace it with the changed version
5. We remove the file by doing ```sudo rm /etc/mongod.conf```
6. Then replace it using sudo ```ln -s /vagrant/environment/mongod.conf /etc```
7. Next we need to restart mongodb and enable it. We use ```sudo systemctl restart mongod``` and ```sudo systemctl enable mongod``` to do this.
8. Your code should look like this

![Alt text](MongoDB%20provision.png)

9. Then use ```vagrant up``` in VS
10. Once it has loaded us Git Bash and run ```vagrant ssh app```
11. We use ```sudo nano .bashrc``` which will bring up a file and we need to go to the bottom underneath eveything else
12. We then write ```export DB_HOST=mongodb://192.168.10.150:27017/posts```
13. A break down of the above code is we use export to define the variable, DB_HOST was already given to use to use by the Dev team, the IP address is the same we already entered in our vagrant file, 27017 is the default MongoDB port and posts is the page that the Dev team passed us
14. Use ctrl x, press y and then enter to save and exit
15. We now need to refresh the file using ```source .bashrc```
16. We can use ```printenv DB_HOST``` to show us the variable we created
17. Now we need to go into the location of our app using ```cd app```
18. Then install npm using ```npm install```
19. After it has installed use ```node seeds/seed.js``` to run the file to seed the database
20. Then start the app using ```node app.js```
21. Now we go into a browser and enter ```192.168.10.100:3000/posts``` which should bring up the Sparta posts page