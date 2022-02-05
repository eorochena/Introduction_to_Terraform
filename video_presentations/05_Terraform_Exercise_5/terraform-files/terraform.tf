terraform {
  backend "azurerm" {
    resource_group_name  = "exercise04"
    storage_account_name = "exercise04"
    container_name       = "exercise04-container"
    key                  = "terraform.tfstate"
  }
}
