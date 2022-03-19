# Exercise 7

In this exercise we will be adding additional disk to our virtual machines.

## azurerm_managed_disk

This module is used to create additional disks[^1].

## azurerm_virtual_machine_data_disk_attachment

This module attaches the disks to the virtual instances, it does that by relying on LUN (Logical Unit Number)[^2]. 


Command           |  Effect                                          | Status
------------------|--------------------------------------------------|------------
terraform init    | Initializes workplace                            | Available
terraform fmt     | Rewrite configuration files                      | Available
terraform plan    | Creates execution plan                           | Available
terraform show    | Human readable format for plan or state file     | Available
terraform graph   | Generates graphical represetation of plan file   | Available
terraform apply   | Deploys execution plan                           | Available
terraform refresh | Reads current state of remote instances          | Deprecated

[^1]: https://docs.microsoft.com/en-us/azure/virtual-machines/managed-disks-overview
[^2]: https://docs.microsoft.com/en-us/azure/virtual-machines/linux/azure-to-guest-disk-mapping

