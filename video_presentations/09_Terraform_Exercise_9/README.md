# Exercise 9

For this exercise we will briefly discuss about data and module sources in Terraform.

## Data Source

Data sources allow us the ability to use virtual instances on our deployments without incorporating those resources into our terraform.tfstate file[^1].

## Module Source

The Module Source allows us to reference a source code for a particular terraform code block[^2].

### Commands Discussed

Command           |  Effect                       | Status
------------------|-------------------------------|------------
terraform init    | Initializes workplace         | Available
terraform fmt     | Rewrites configuration files  | Available
terraform plan    | Creates execution plan        | Available
terraform apply   | Deploys execution plan        | Available

[^1]: https://www.terraform.io/language/data-sources
[^2]: https://www.terraform.io/language/modules/sources

