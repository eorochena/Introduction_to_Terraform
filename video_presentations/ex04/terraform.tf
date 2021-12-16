terraform {
  backend "azurerm" {
    resource_group_name  = "eduardo-tfstate-rg"
    storage_account_name = "eduardotfstate"
    container_name       = "eduardotfstate"
    key                  = "hpccoops.tfstate"
  }
}
