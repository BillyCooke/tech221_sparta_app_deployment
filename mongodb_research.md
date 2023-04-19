# MongoDB

## What is MongoDB?
MongoDB is a document database with the scalability and flexivility that you want with the querying and indexing you need. It is a NoSQl database programme.

## What are NoSQL databases?
A NoSQL database is a non-tabular database used for storage and retrieval of data. Whereas SQL databses use a colelction of tables to store data.

## Why is MongoDB popular?
* Document validation
* Fine-grained locking
* Vibrant community of users
* Mature ecosystem of tools

## History of MongoDB
Mongo DB used to just be a data store for JSON which it was very efficient at but it then introduced sharding and being able to horizontally calle using commodity hardware is why it became so popular. Over the years it grew and gained more framewroks such as the aggregatrion framework which again drew more popularity.

## MongoDB diagram
![Alt text](Mongodb%20diagram.png)
In the above diagram a query can take two routes. The first route is that the query is passed directly from the Mongo library to the desired shard. The other route is once a query has been made it goes to the Mongo library and is passed onto the router. The router communicates with the config server and then the query is passed onto the desrired shard. The config server holds data about the information in a shard.

## What is seeding in MongoDB?
Seeding a databse is a process where a set of inital data is provided to a database when it is being installed.

## Why do Mongo databases need to be seeded?
Seeding in Mongo will allow you to test out yur queries without being restricted. It allows you to essentially play around with the database.

## What port does MongoDB use?
* 27017 is the default port number
* 27018 is used when running with ```--shardsvr``` command
* 27019 is used when running with ```--configsvr``` command
* 27020 is the port from which mongocryptd listens for messages

## How to connect to a Mongo databse
To connect to a Mongo database 