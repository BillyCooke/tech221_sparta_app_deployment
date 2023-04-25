# VPC architecture

## What is a VPC?
A VPC is a virtual private cloud which provides another layer of security

## What are the benefits?
* Greater security as it is isolated from the public cloud
* Easy to deploy
* Increased agility as users have full control over the network size

## Internet gateway
An internet gateway is a VPC component that allows communication between your VPC and the internet. It is where the data stops on its way to or from a network.

## What is a subnet?
* A network inside a network
* They make networks more efficient
* Network traffic does not need to go through unnecessary routers to rezch the destination

## What is CIDR block?
A Classless inter-domain routing is a colleciton of IP addresses that share the same network prefix.

## Route tables
A route table is a data table stored in a router or a netwrok host that lists the routes to particular network destinations.

## Creating a VPC
1. Go into AWS and serach for VPC
2. Click create a VPC
3. Select VPC only
4. Name the VPC. For example billy-tech221-vpc-1
5. Enter the IPv4 CIDR using ```10.0.0.0/16```
6. Then select create VPC
7. Next we need to create an internet gateway
8. On the dashboard on the left select internet gateway
9. Name the internet gateway. Example ```billy-tech221-IG-vpc```
10. Select the actions drop down and select attach to a VPC
11. In this page search for your VPC and then select attach internet gateway
12. Next we need to create a subnet so select subnets from the dashbaord
13. Search for your VPC in the top bar
14. Create a name for your subnet. billy-tech221-public-app-subnet
15. In IPv4 CIDR block put in ```10.0.2.0/24```
16. Then select create subnet
17. Now we need to create a route table
18. On the dashboard select route tables and name it. billy-tech221-public-RT
19. Then select the VPC you made
20. Then select create route table
21. Then in that route table select subnet associations and click edit subnet associations
22. Select your subnet and click save associations
23. Then go into routes and edit routes
24. Add a route and in the destination add ```0.0.0.0/0``` then in target add internet gateway and select your internet gateway

## How to launch your app and db instances in your VCP
1. First we need to create AMI's for both the app and db
2. We can do this following our steps we made to create an AMI from an instance
3. Once they are set up we can terminate our existing instances
4. Then we want to launch an instance for our app using our app AMI we just made. We need to make sure we add ports 3000 and ssh
5. When we are setting up the instance after we have named it we want to change the deafult VPC to our own one and make sure the subnet below it is our public subnet that we made
6. Then launch the instance
7. Then create a new subnet, serach for our VPC and name it appropriately for a private subnet
8. Create a CIDR block
9. Then select create subnet
10. Next we need to create a private route table so go into route tables and select create route table
11. Follow the same steps as before but name it with private instead
12. Select the VPC you made
13. Then select create route table
14. Then in that route table select subnet associations and click edit subnet associations
15. Select your subnet and click save associations
16. Then go into routes and edit routes
17. Do not add ```0.0.0.0/0``` in your route
18. Got to your AMI's and launch your db instance using your db AMI
19. Name is and select your VPC
20. Make sure to select the private subnet you just made
21. Add port 27017
22. Make sure the auto-enable punlic IP address is disabled
23. Launch the instance

## Connecting the app and db
1. Load up a Git Bash terminal and cd into the .ssh directory
2. Select your app instance and click connect
3. Use the code at the bottom to paste it into Git Bash to ssh into your instance
4. Then use sudo ```nano .bashrc``` to go into the environment variable file and go to the bottom
5. Create an environment variable using ```export DB_HOST=mongodb://10.0.4.45:27017/posts``` The IP is the private IP from your db instance
6. Use ctrl x, press y and then enter to save and exit
7. Run ```source .bashrc``` to implement the changes
8. Use ```cd app``` to go into your app folder
9. Then run ```npm start```
10. You should see the below

![Alt text](npm%20start.png)

11. Go into your app instance and copy the public IP and paste it into a browser
12. Add ```:3000/posts``` onto the end to see the data recieved from the database