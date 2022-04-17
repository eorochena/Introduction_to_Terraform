# Exercise 8

In this exercise we will cover terraform state file.

## Terraform State

By default Terraform stores the state of the infrastructure and configuration of the cloud resources on the ```terraform.tfstate``` file, this file can be stored locally or remotely[^1].

## Terraform inport

You can import resources into your state file by using the ```terraform import <resource.definition> <resource-id>```[^2].


## Terraform State Commands
 


Command           |  Effect                                          
------------------|--------------------------------------------------
terraform state list  | List or displays the resources in the state file[^3]                            
terraform state pull  | Pulls remote state file[^4]                      
terraform state push   | Updates remote state file[^5]                           
terraform state rm <resource>   | Removes resources from the state file[^6]     
terraform state show <resource>   | Displays resource in state file[^7]   
terraform state mv <source-resource> <destination-resource>   | Move an item in the state[^8]                           
terraform state replace-provider <from-rpovider> <to-provider> | Replaces provider[^9]         

[^1]: https://www.terraform.io/language/state
[^2]: https://www.terraform.io/cli/import 
[^3]: https://www.terraform.io/cli/commands/state/list
[^4]: https://www.terraform.io/cli/commands/state/pull
[^5]: https://www.terraform.io/cli/commands/state/push
[^6]: https://www.terraform.io/cli/commands/state/rm
[^7]: https://www.terraform.io/cli/commands/state/show
[^8]: https://www.terraform.io/cli/commands/state/mv
[^9]: https://www.terraform.io/cli/commands/state/replace-provider

