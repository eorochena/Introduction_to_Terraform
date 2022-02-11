# Exercise 5

For this exercise we will make use of the storage account that we previously created back on exercise 4 to store the Terraform state file, we will also create availability sets, make use of the ```for_each``` meta-argument.

## Availability Sets

Availability sets are used as a way to improve the application availability by adding redundancy[^1].

## for_each

The ```for_each``` meta-argument offers similar functionality as ```count``` in the sense that allows you to create multiple virtual instances using one single resource block, 
both methods are mutually exclusive[^2]. 

## depends_on

The ```depends_on``` meta-argument is used to handle resource dependencies. By adding this to a resource block it will make terraform postpone its creation until the dependent resource(s) get created[^3].


Command           |  Effect                                          | Status
------------------|--------------------------------------------------|------------
terraform init    | Initializes workplace                            | Available
terraform fmt     | Rewrite configuration files                      | Available
terraform plan    | Creates execution plan                           | Available
terraform show    | Human readable format for plan or state file     | Available
terraform graph   | Generates graphical represetation of plan file   | Available
terraform apply   | Deploys execution plan                           | Available
terraform refresh | Reads current state of remote instances          | Deprecated

[^1]: https://docs.microsoft.com/en-us/azure/virtual-machines/availability-set-overview
[^2]: https://www.terraform.io/language/meta-arguments/for_each
[^3]: https://www.terraform.io/language/meta-arguments/depends_on
