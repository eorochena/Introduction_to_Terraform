# Exercise 3

For this exercise we will add a load balancer to our configuration and we will also cover proximity placement groups and accelerated networking.

## Proximity Placement Groups

Proximity placement groups are used to place virtual resources as closer together as feasible, usually the main objective is to reduce network latency[^1].



Command           |  Effect                                          | Status 
------------------|--------------------------------------------------|------------
terraform init    | Initializes workplace                            | Available
terraform fmt     | Rewrite configuration files                      | Available
terraform plan    | Creates execution plan                           | Available
terraform show    | Human readable format for plan or state file     | Available
terraform graph   | Generates graphical represetation of plan file   | Available
terraform apply   | Deploys execution plan                           | Available

[^1]: https://docs.microsoft.com/en-us/azure/virtual-machines/co-location
