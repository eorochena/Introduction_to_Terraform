resource "azurerm_storage_account" "remote_state_file" {
  name                     = "${var.resource_group}-storage-account"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags                     = local.required_tags
}

resource "azurerm_storage_container" "remote_container" {
  name                  = "${var.resource_group}-container"
  storage_account_name  = azurerm_storage_account.remote_state_file.name
  container_access_type = "private"
}
