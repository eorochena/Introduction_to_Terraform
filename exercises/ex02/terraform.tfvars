resource_group = "eduardo_rg"
region         = "eastus2"
labels         = { "environment" = "production", "subscription" = "hpccops", "market" = "us", "resource_group_type" = "app" }
acc_net        = true
vmSize         = { "small" = "Standard_L8s_v2", "medium" = "Standard_L16s_v2" }
storageAccType = "Premium_LRS"
publisher      = "Canonical"
numVMs         = 2
diskSize       = 30
username       = ["azureuser", "root", "admin"]
