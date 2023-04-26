# Load balancer and autoscaling

## What is a load balancer?

A load balancer is a device that receives traffic from the internet and sends it to the instances. If the instances are broken it will stop the traffic and divert it to a working instance nearby. It will then wait for the instance to be fixed or a new one made before redirecting the traffic back to it.

## What is autoscaling?

An autoscaling group has the job of dealing with the broken instances. Whilst the load balancer stops the tarffic the autoscaling group terminates the instance and replaces it with a new one. Once the new instance is ready to go the autoscaling group sends a message to the load balancer to say it can now redirect the traffic back.

## Load balancer and autoscaling diagram

![Alt text](autoscaling.png)

In the diagram above:
1. The traffic comes in from users and passes through the load balancer
2. The load balancer is set with a target group of certain ports that canuse this
3. If there are no issues then the traffic passes onto the instances as normal
4. If there are any problmes with the instances such as if one is broke then the load balancer will stop the traffic and redirect it to a nearby instance.
5. Then the autoscaling group automatically starts to launch a new instance and terminates the old one.
6. Once the new instance is up and running and load balancer will direct the traffic back to it.
7. The diagram also shows that we are not always running at maximum capacity and autoscaling helps us with that
8. We can set rules for the autoscaling groups for example to say if CPU utilization goes above 50% then more instances are need or if it drops below a certain percentage then to terminate some instances
9. The autoscaling group will monitor this and will automatically launch or terminate instances to scale to the utilization

## Benefits of this
* Instances are not overloaded with traffic
* If there are errors in an instance then the software can still run
* Reduced costs
* Less downtime