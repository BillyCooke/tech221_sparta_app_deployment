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