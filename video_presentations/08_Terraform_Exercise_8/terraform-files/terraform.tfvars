resource_name            = "exercise08"
labels                   = { "owner" = "myself", "subscription" = "devops", "market" = "USA", "resource_group_type" = "app", "lifecycle" = "production" }
acc_net                  = false
vmSize                   = { "production" = "Standard_DS1_v2", "development" = "Standard_DS2_v2" }
account_replication_type = { "global" = "GRS", "local" = "LRS" }
username                 = ["root", "azureuser"]
diskSize                 = 50
storageSize              = 50
storageAccType           = "Standard_LRS"
publisher                = "Canonical"
offer                    = "UbuntuServer"
sku                      = "18.04-LTS"
osVersion                = "latest"
