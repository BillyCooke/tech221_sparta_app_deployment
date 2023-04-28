# Monitoring and alert management

## What is monitoring?
AWS scans your resources and applications to ensure everything is oeprating correctly.

## Why do you need to monitor?
It is important to have a monitor in placeto prvide a log of any errors or times when things were running slow. This can help to improve customer satisfaction as the team are more aware of what is happening when they aren't on site.

## Four golden rules of monitoring
* Latency - time it takes to respond to a request
* Traffic - measurement of demand
* Errors - failures
* Saturation - how full your service is

## What is alert management?
It enables you to focus on the critical incidents that result in less uptime. It filters alerts to the most relevant errors and gives you a better understanding on how your services work compared to customer demand.

## SNS - simple notification service
A notification service the provides a low cost system for mass delivery of messages. It manages the delivery of messages to endpoints or clients.

## SQS - simple queue service
It allows you to do the below without losing messages or requiring other services.
* Send messages
* Store messages
* Receive messages

## Cloud watch to monitor AWS service/s
Cloud watch allows to you monitor your complete stack 

## How to create an alarm
1. First launch a simple instance
2. Go onto AWS and type in SNS and select topics from the left
3. Click create topic
4. On this page select standard for type and name your topic billy-tech221-alarm
5. Click create topic
6. Next select create subscription
7. Select your topic ARN and select email 
8. Then enter the emaila ddress that you would like the notification to go to
9. Click create subscription
10. You will get an email from AWS which you need to slect confirm on
11. Now back on AWS search in Cloud Watch and select all alarms from the left
12. Click create alarm
13. Select the metric you would like to monitor, I chose CPU Utilization under EC2
14. Then copy over your instance ID and paste it under instance ID
15. Specify the time period and the conditions
16. I stated 5 minutes and gave a condition of greater than 10
17. You will be taken to a configure page and you need to select in alarm for the alarm state trigger
18. Then select an existing SNS topic and search your name in who to send notification to
19. Select next, name the alarm and provide a message to send with the alarm
20. Now when the CPU utilization is greater than 10% you will get an email with your message on what to do

## How to add a dashboard
1. In cloud watch, on the left click dashboards and create dashboard
2. Name your dashboard
3. Then go back to your alarm and select it
4. In the top right under actions select add to dashboard