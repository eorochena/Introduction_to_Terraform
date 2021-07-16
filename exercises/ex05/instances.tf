#################################
# Virtual Machine Configuration #
#################################

resource "azurerm_linux_virtual_machine" "vm" {
  count                           = var.numVMs
  name                            = "${var.resource_group}-vm-${count.index}"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  network_interface_ids           = [azurerm_network_interface.network_if[count.index].id]
  size                            = var.labels["environment"] == "production" ? var.vmSize["medium"] : var.vmSize["small"]
  admin_username                  = var.username[0]
  disable_password_authentication = true
  proximity_placement_group_id    = azurerm_proximity_placement_group.proximity-placement-group.id
  tags                            = local.required_tags

  os_disk {
    name                 = "${var.resource_group}-disk-${count.index}"
    caching              = "ReadWrite"
    storage_account_type = var.storageAccType
    disk_size_gb         = var.diskSize
  }

  source_image_reference {
    publisher = var.publisher
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  admin_ssh_key {
    username   = var.username[0]
    public_key = file("~/.ssh/id_rsa.pub")
  }

  connection {
    user        = var.username[0]
    host        = azurerm_public_ip.public_ip[count.index].ip_address
    private_key = file("~/.ssh/id_rsa")
  }

  provisioner "file" {
    source      = "files/index.html"
    destination = "/home/${var.username[0]}/index.html"
  }

  provisioner "remote-exec" {
    inline = ["sudo apt update",
      "sudo apt install apache2 -y",
      "sudo mv /home/${var.username[0]}/index.html /var/www/html/",
    "sudo systemctl restart apache2"]
  }
}

