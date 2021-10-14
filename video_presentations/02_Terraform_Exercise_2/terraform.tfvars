resource_group       = "exercise-2"
region               = "eastus"
numVMs               = 2
vmSize               = { "small" = "Standard_D2_v3", "medium" = "Standard_L8s_v2", "big" = "Standard_L64s_v2" }
username             = ["azureuser", "root", "admin"]
storage_account_type = ["Standard_LRS", "Premium_LRS"]
diskSize             = 30
