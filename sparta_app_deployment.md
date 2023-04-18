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