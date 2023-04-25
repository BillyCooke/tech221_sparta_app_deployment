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
4. Then we need to access this directory ```cd /etc/nginx/sites-available```
5. Then we need to create a file by doing ```sudo nano nodeapp.conf```
6. We need to enter in the below
server {
   listen 80;
   server_name <server name>;

   location / {
       proxy_pass http://<server name>:3000;
       proxy_set_header Host $host;
       proxy_set_header X-Real-IP $remote_addr;
       proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
       proxy_set_header X-Forwarded-Proto $scheme;
   }
}
7. Then use this ```sudo ln -s /etc/nginx/sites-available/nodeapp.conf /etc/nginx/sites-enabled/nodeapp.conf``` to create the link
8. Then use ```sudo nginx -t``` to test the connection
9. Next use ```sudo systemctl reload nginx```
10. Use ```cd``` and then ```cd app``` to go into the app folder
11. Then use ```node app.js``` to run the app
12. Copy your punblic IP address from your instance on AWS and paste it into a browser
13. This will now load up the Sparta App page
14. Previosuly you would have needed to add ```:3000``` at the end of the IP to do this but now you only need the IP with the reverse proxy




