resource_information = { "production" = "eastus", "development" = "eastus2" }
labels               = { "environment" = "production", "subscription" = "operations", "market" = "us", "resource_group_type" = "app" }
subnets              = { "production" = "10.0.0.0/24", "development" = "10.0.1.0/24" }
acc_net              = false
vmSize               = { "production" : "Standard_D1_v2", "development" = "Standard_D2_v2" }
username             = ["azureuser", "panchoVilla"]
diskSize             = 30
storageAccType       = "Standard_LRS"
publisher            = "Canonical"
offer                = "UbuntuServer"
sku                  = "18.04-LTS"
osVersion            = "latest"
