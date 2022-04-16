# Exercise 1

For this exercise we will deploy a resource group, a virtual network, a network security group and a single virtual machine.

## Basic Concepts

### Providers
Terraform providers are the plugins used to interact with the cloud providers through their specific API[^1].

### Data Sources (http)
The HTTP data source is used to retrieve data from a URL via an HTTP GET request[^2].

### Resource Group
The resource group is like a container that holds all the necessary components for a given project[^3]. As a bit of an oversimplification, you can think of a resource group as your own datacenter.

### Virtual Network
The Azure virtual network allows communication between the virtual instances that reside inside the resource group and it also allows traffic to and from other systems outside the resource group like the internet, other resource groups or internal datacenters via an express route[^4].

### Subnet  
A subnet is just a range of internal, non-routable, ip addresses in the virtual network. A virtual network can have several subnets[^5].

### Public IP Address
Public ip addresses allow communication between the virtual instances that reside inside a virtual network and the internet[^6].

### Network Interface
The network interface facilitates network traffic between the virtual machines and the virtual network[^7].

### Network Security Group
Network security group can restrict or filter access to and from the virtual resources in the virtual network[^8] in this sense the network security group acts as a firewall. 

### Network Interface Security Group Association
This resource manages the association between a network interface and a network security group[^9].

### Virtual Machines (Linux)
Virtual machines are virtualization or emulation of physical/bare metal compute resources[^10].

### Outputs
Terraform outputs return the value or output of a terraform module[^11].

### Commands Discussed

Command           |  Effect                       | Status
------------------|-------------------------------|------------
terraform init    | Initializes workplace         | Available
terraform fmt     | Rewrites configuration files  | Available
terraform plan    | Creates execution plan        | Available
terraform apply   | Deploys execution plan        | Available


[^1]: https://www.terraform.io/docs/language/providers/index.html 
[^2]: https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http 
[^3]: https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal 
[^4]: https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview 
[^5]: https://docs.microsoft.com/en-us/azure/virtual-network/network-overview 
[^6]: https://docs.microsoft.com/en-us/azure/virtual-network/ip-services/public-ip-addresses 
[^7]: https://docs.microsoft.com/en-us/azure/virtual-network/network-overview#network-interfaces 
[^8]: https://docs.microsoft.com/en-us/azure/virtual-network/network-security-groups-overview
[^9]: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association
[^10]: https://docs.microsoft.com/en-us/azure/virtual-machines/linux/overview
[^11]: https://www.terraform.io/docs/language/values/index.html 
