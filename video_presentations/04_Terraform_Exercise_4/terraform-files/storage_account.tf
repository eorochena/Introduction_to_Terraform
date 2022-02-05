resource "azurerm_storage_account" "remote_state_file" {
  name                      = var.resource_group
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  account_tier              = "Standard"
  account_kind              = "StorageV2"
  allow_blob_public_access  = false
  account_replication_type  = var.labels["environment"] == "production" ? var.account_replication_type["global"] : var.account_replication_type["local"]
  min_tls_version           = "TLS1_2"
  enable_https_traffic_only = true
  tags                      = local.required_tags
}

resource "azurerm_storage_account_network_rules" "storage_network_rules" {
  storage_account_id = azurerm_storage_account.remote_state_file.id

  default_action = "Deny"
  ip_rules       = [chomp(data.http.ip_address.body)]
  bypass         = ["Metrics", "AzureServices"]
}

resource "azurerm_storage_container" "remote_container" {
  name                  = "${var.resource_group}-container"
  storage_account_name  = azurerm_storage_account.remote_state_file.name
  container_access_type = "private"
}
