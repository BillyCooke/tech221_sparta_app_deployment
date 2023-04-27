# Disaster recovery plan

## What is a disaster recovery plan?

A disaster recovery is the process of maitaining or reestablishing infrastructure in the event of an uplanned incident such as natural disasters or human error. It is a detailed document on what to do.

## Use cases
* IBM use it for multiple things such as personnel, application profile, inventory profile and the rebuilding process
* Micro Focus use it for key personnel contact info, media, insurance and financial issues

## Benefits
* Cost efficiency - it involves process to detect errors and rapdily correct them
* Improved customer satisfaction - less downtime
* Evaluate critical needs

## What is S3?
Amazon S3 is a simple storage service that provides storage through a web service. A file is known as an object and a folder is known as a bucket.

## Use cases for S3?
* Back-up and recovery
* 

## Storage classes


## What is AWSCLI?
The AWS command line interface is an open source tool that enables you to interact and manage your AWS services using commabds in your command line shell.

## What is SDK?
Software development kit is the collection of various software development tools in one installable package that developers can used to build software.

## Accessing S3

1. First we need to launch an instance using ubuntu 18.04
2. Set it up in the normal away but allow SSH/port22 only in the security group
3. SSH into the instance on Git Bash
4. Run the commands ```sudo apt update -y``` and then sudo ```sudo apt upgrade -y```
5. Then we need to install python using ```sudo apt install python```
6. Then run ```sudo apt install python3-pip```
7. Then we need to create an alias for python as it is currently listed as python3 and it will not run the most up to date version
8. Use alias ```python=python3```
9. Run ```python --version``` to check what version you now have. If it is above 3.6.7 then continue
10. Next we need to install AWSCLI using ```sudo python3 -m pip install awscli```
11. Then use the command ```aws configure```
12. It will then ask you to provide some keys and details
13. We were given our private keys by Shahrukh so we enter those in the first two lines. We can find this in our .ssh folder
14. Next we enter ```eu-west-1``` as that is the code for Ireland
15. Then enter how you want to read the code, we used ```json```
16. Now we want to connect to AWS S3
17. We can use ```aws s3 ls``` to view everything that is currently being stored
18. In the code above aws states the cloud service, s3 states the service and ls shows what is inside

## S3 diagram

![Alt text](S3%20diagram.png)

## How to create an S3 bucket and use CRUD (Create, Read, Update and Delete)
1. In your instance on Git Bash use aws ```s3 mb s3://billy-tech221``` to make a bucket called billy-tech221
2. Make a file to test the upload ```sudo nano test.txt``` and write anything inside but comment it out
3. Copy the file over to the bucket using ```aws s3 cp test.txt s3://billy-tech221```
4. In the command above aws states the cloud service, s3 states the service, cp is the commoand to copy, test.txt is the test file we made and s3://billy-tech221 is the location where we want to uplaod to
5. To download a file we use ```aws s3 cp s3://billy-tech221/test.txt /home/ubuntu```
6. To delete the file use ```aws s3 rm s3://billy-tech221/test.txt```
7. To delete the bucket use ```aws s3 rb s3://billy-tech221```

## S3 storage classes
You can choose different types of stoarge classes depending on how often you intend to access the data you have stored. If you want to access it for general needs then using S3 Standard would be sueful however if you might need the data every couple of years then S3 Glacier may be mroe useful. By having more options on storage you can help to reduce costs as classes such as Glacier cost less than a more frequently used class.

## How to use boto3 to create an S3 bucket and use CRUD
1. Launch a new instance with just port 22
2. Follow the steps for accessing S3
3. Use ```pip3 install boto3```

## To create a bucket with boto3
1. Create a file using ```sudo nano bucket.py```
2. Enter in the below

```import boto3```

```AWS_REGION = "eu-west-1"```

```client = boto3.client("s3", region_name=AWS_REGION)```

```bucket_name = "billy-tech221"```

```location = {'LocationConstraint': AWS_REGION}```

```response = client.create_bucket(Bucket=bucket_name, CreateBucketConfiguration=location)```

```print("Amazon S3 bucket has been created")```

3. Run the script using python bucket.py

## How to upload a file using boto3
1. Make another file using ```sudo nano upload.py```
2. Enter in the below

```
import boto3
# Set up the S3 client
s3 = boto3.client('s3')
# Set up the local file path and S3 bucket/key
local_file_path = 'test/test.txt'
s3_bucket = 'billy-tech221'
s3_key = 'test/test.txt'
# Upload the file to S3
s3.upload_file(local_file_path, s3_bucket, s3_key)
print(f"{local_file_path} uploaded to s3://{s3_bucket}/{s3_key}")
```

3. Use python upload.py to run it

## How to download a file using boto3
1. Delete your test file using ```rm test.txt``` on your instance
2. Then as before we need to create a file for a script ```sudo nano download.py```
3. Then enter the following
```
import boto3

s3 = boto3.client('s3')
s3.download_file('billy-tech221', 'test.txt', 'test.txt')
```
4. Use ```python download.p```y to run it
5. You can then use ```ls``` to check if it is now downloaded

## How to delete a file using boto3
1. Make another file for a script called delete.py
2. Enter in the below
```
import boto3

client = boto3.client('s3')
s3 = boto3.resource('s3')

bucket_name="billy-tech221"

s3.Object(bucket_name, 'test.txt').delete()
```

3. Then use ```python delete.py``` to run it

## How to delete a bucket using boto3
1. Create a file for a new script called ```delete-bucket.py```
2. Enter in the below
```
import boto3

client = boto3.client('s3')
s3 = boto3.resource('s3')

bucket_name="oleg-tech221"

response = client.delete_bucket(
        Bucket=bucket_name,
)
```

3. Then use ```python delete-bucket.py``` to run it