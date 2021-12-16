resource_group = "exercise-3"
location       = "eastus2"
labels         = { "environment" = "development", "subscription" = "my-subscription", "market" = "us", "resource_group_type" = "application" }
acc_net        = true
vmSize         = { "small" = "Standard_D2_v3", "medium" = "Standard_L16s_v2" }
storageAccType = "Premium_LRS"
publisher      = "Canonical"
numVMs         = 2
diskSize       = 30
username       = ["azureuser", "root", "admin"]
