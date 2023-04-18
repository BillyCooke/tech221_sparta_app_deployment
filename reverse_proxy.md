# Nginx reverse proxy

## What are ports?
A port is a number assigned to identify a connection endpoint and to direct data to a specific service. It is where network connections start and end.

## What is a reverse proxy?
It is an application that sits in front of servers and sends client requests onto the relevant server.

## Reverse proxy diagram
1. Clients make request for information which is transported to the internet via HTTP
2. The internet then passes these requests onto a reverse proxy
3. The reverse proxy reads the requests and passes them onto the relevant server

![Alt text](Reverse%20proxy%20diagram.png)

## Forward proxy diagram
1. Clients make request for information which is transported the forward proxy via HTTP
2. The foward proxy then forwards the information onto the internet
3. The internet passes the information onto the servers

![Alt text](Forward%20proxy%20diagram.png)

## What are the differences?
Here are some quick differences between the two
* Forward proxy sits in front of the users whereas a reverse proxy sits in front of the servers
* Forward proxy can be used with a private network to protect clients information
* Forward proxy can be sued to access different regional information such as using a VPN
* Reverse proxys can increase the security of a server by preventing any malicious requests
* Reverse proxys help with load balancing by distributing traffic to multiple back-end servers so that it can handle more client requests

The main difference between the two is that a forward proxy protects a client (i.e using a VPN) and a reverse proxy helps to protect the servers.

## What is Nginx's default configuration?

## How do you set up an Nginx reverse proxy?
To set up an Nginx reverse proxy you must do the following
1. You must first have Nginx installed, you can do this using ```sudo apt install nginx -y```
2. I already had it installed so I used ```sudo systemctl status nginx``` to check
3. Next we need to disable the virtual host using ```sudo unlink /etc/nginx/sites-enabled/default```
4. 

