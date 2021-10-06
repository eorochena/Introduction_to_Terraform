## Exercise 1

### Providers
Terraform providers are the plugins used to interact with the cloud providers through their specific API .

### Data Sources (http)
The HTTP data source is used to retrieve data from a URL via an HTTP GET request .

### Resource Group
The resource group is like a container that holds all the necessary components for a given project . As a bit of an oversimplification, you can think of a resource group as your own datacenter.

### Virtual Network
The Azure virtual network allows communication between the virtual instances that reside inside the resource group and it also allows traffic to and from other systems outside the resource group like the internet, other resource groups or internal datacenters via an express route .

### Subnet  
A subnet is just a range of internal, non-routable, ip addresses in the virtual network. A virtual network can have several subnets .

### Public IP Address
Public ip addresses allow communication between the virtual instances that reside inside a virtual network and the internet .

### Network Interface
The network interface facilitates network traffic between the virtual machines and the virtual network.

### Network Security Group
Network security group can restrict or filter access to and from the virtual resources in the virtual network  in this sense the network security group acts as a firewall. 

### Network Interface Security Group Association
This resource manages the association between a network interface and a network security group .

### Virtual Machines (Linux)
Virtual machines are virtualization or emulation of physical/bare metal compute resources .

### Outputs
Terraform outputs return the value or output of a terraform module .

