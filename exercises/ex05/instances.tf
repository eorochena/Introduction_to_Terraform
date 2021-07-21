#################################
# Virtual Machine Scale Set     #
#################################

resource "azurerm_virtual_machine_scale_set" "vmss" {
  name                 = "${var.resource_group}-vmss"
  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  upgrade_policy_mode  = "Manual"
  automatic_os_upgrade = false
  tags                 = local.required_tags

  sku {
    name     = var.labels["environment"] == "production" ? var.vmSize["medium"] : var.vmSize["small"]
    tier     = "Standard"
    capacity = var.numVMs
  }

  os_profile {
    computer_name_prefix = "vm-"
    admin_username       = var.username[0]
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      path     = "/your-casa/user-account/.ssh/authorized_keys"
      key_data = file("~/.ssh/id_rsa.pub")
    }
  }

  storage_profile_os_disk {
    name              = ""
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_profile_image_reference {
    publisher = var.publisher
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  network_profile {
    name    = "my-network-profile"
    primary = true

    ip_configuration {
      name      = "my-ip-c onfiguration"
      primary   = true
      subnet_id = azurerm_subnet.subnet.id
    }
  }

  connection {
    user        = var.username[0]
    host        = azurerm_public_ip.public_ip.ip_address
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

