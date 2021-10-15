# Exercise 2

For this exercise we will deploy a resource group, a virtual network, a network security group and a single virtual machine, in addition to that we will cover terraform variables,
azure proximity placement groups and terraform provisioners.

## variables.tf

The variables.tf file is used to declare the variables in terraform[^1].

## terraform.tfvars

The terraform.tfvars file is used to set the values of the variables[^2].

## Terraform Data Types[^3] 

**String:** Strings are data types that store a sequence of Unicode characters and are surrounded by double quotes.

**Number:**  Numeric values that can be positive numbers or decimal (fractional).

**Bool:** Boolean values can be either true or false.

**List:** Sequence of items.

**Map:** Maps are used to store and retrieve data using a key = value pair relationship instead of the relative position of the stored objects.

## Proximity Placement Groups

Proximity placement groups are used to place virtual resources as closer together as feasible, usually the main objective is to reduce network latency[^4].

## Count 

The count object is used to create multiple resources of the same type[^5].

## Provisioner

Terraform provisioners can be used to perform specific actions or the remote virtual machines or even in the local system[^6]. The types of provisioners are:

**File:** The file provisioner is used to copy data to the remote virtual machines[^7].
**Remote-exec:** This file provisioner is used to execute commands or scripts or the remote system[^8].
**Local-exec:** Used to execute commands or scripts on the local system[^9].


Command           |  Effect                       | Status
------------------|-------------------------------|------------
terraform init    | Initializes workplace         | Available
terraform fmt     | Rewrites configuration files  | Available
terraform plan    | Creates execution plan        | Available
terraform apply   | Deploys execution plan        | Available

[^1]: https://www.terraform.io/docs/language/values/variables.html 
[^2]: https://www.terraform.io/docs/configuration-0-11/variables.html#variable-files 
[^3]: https://www.terraform.io/docs/language/expressions/types.html
[^4]: https://docs.microsoft.com/en-us/azure/virtual-machines/co-location
[^5]: https://www.terraform.io/docs/language/meta-arguments/count.html 
[^6]: https://www.terraform.io/docs/language/resources/provisioners/syntax.html
[^7]: https://www.terraform.io/docs/language/resources/provisioners/file.html 
[^8]: https://www.terraform.io/docs/language/resources/provisioners/remote-exec.html 
[^9]: https://www.terraform.io/docs/language/resources/provisioners/local-exec.html 
