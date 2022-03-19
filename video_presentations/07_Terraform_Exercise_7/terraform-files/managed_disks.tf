resource "azurerm_managed_disk" "managed_disk" {
  depends_on           = [azurerm_resource_group.rg]
  for_each             = var.vmSize
  name                 = "${var.resource_name}-${each.key}"
  location             = var.location
  resource_group_name  = var.resource_name
  storage_account_type = var.storageAccType
  create_option        = "Empty"
  disk_size_gb         = var.storageSize
}

resource "azurerm_virtual_machine_data_disk_attachment" "disk_attach" {
  depends_on         = [azurerm_linux_virtual_machine.vm, azurerm_managed_disk.managed_disk]
  for_each           = var.vmSize
  managed_disk_id    = azurerm_managed_disk.managed_disk[each.key].id
  virtual_machine_id = azurerm_linux_virtual_machine.vm[each.key].id
  lun                = "10"
  caching            = "ReadWrite"
}
