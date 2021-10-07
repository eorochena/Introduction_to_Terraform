# Introduction to Terraform
 

Terraform is a software application used to deploy virtual resources, for this small tutorial we will focus on instantiating resources on the Microsoft Azure Cloud.


### Infrastructure as Code

Infrastructure as code is how we define the resources that we want to deploy. Virtual network, virtual machines and network security groups are some of the resources that can be deployed using this tool.


### Basic Terraform Commands

The terraform CLI has several commands, but for now we will focus on just a few of them.
* terraform init
* terraform fmt
* terraform validate
* terraform plan
* terraform apply
* terraform destroy


### Terraform init

This command initializes and downloads the necessary tools required to interact with a given cloud provider.
* Infrastructure as a service: Azure, AWS and GCP.
* Platform as a service: Kubernetes (k8’s).
* Software as a service: Datadog, artifactory.


### Terraform validate

Terraform validate, validates the terraform template files, basically checks for syntax errors.


### Terraform fmt

Formats terraform template files, basically adjusts spacing and indentation.


### Terraform plan

Terraform plan creates the execution plan; it lays out the actions to perform during the resource creation.


### Terraform apply

Applies or executes the actions described on the terraform plan. Some tasks will be done in parallel while others sequentially.


### Terraform destroy

Destroys the remote resources that are managed by terraform.


### Terraform State File

Terraform uses the state file to keep track of the status of the remote resources being managed by it. The default name of the state file is terraform.tfstate.


### Additional Resources

* If you want to expand more on this topic you can visit the terraform official documentation at https://www.terraform.io/docs/index.html 
* You can also visit the github repository for this course at https://github.com/eorochena/Introduction_to_Terraform 
And with this with conclude this lesson. 
Thanks for your attention and happy terraforming.



