# Exercise 4

For this exercise we will create an storage account in Azure, we will use it to store the terraform state file in a future video.

## Azure Storage Account

An Azure storage account can contain several kinds of data objects such as data tables, blobs etc[^1]; we will use the ```azurerm_storage_account``` resource to manage it[^2]. 

### Terraform Conditional Expressions

Conditional expressions in Terraform are similar to the ones used in programming languages such as Python, Bash, Perl among others; in this sense conditional expressions assist in the 
decision making process[^3], for example:

    if a value matches or is equal to 1, then perform action 1
    else perform action 2


Command           |  Effect                                          | Status
------------------|--------------------------------------------------|------------
terraform init    | Initializes workplace                            | Available
terraform fmt     | Rewrite configuration files                      | Available
terraform plan    | Creates execution plan                           | Available
terraform show    | Human readable format for plan or state file     | Available
terraform graph   | Generates graphical represetation of plan file   | Available
terraform apply   | Deploys execution plan                           | Available
terraform refresh | Reads current state of remote instances          | Deprecated

[^1]: https://docs.microsoft.com/en-us/azure/storage/common/storage-account-overview
[^2]: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account
[^3]: https://www.terraform.io/language/expressions/conditionals 

