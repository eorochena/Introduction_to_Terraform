######################
# Configure Provider #
######################

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 2.46.0"
    }
  }
}

############
# Provider #
############

provider "azurerm" {
  features {}
}

##################
# Resource Group #
##################

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group
  location = var.region
}

####################################
# Kubernetes Cluster Configuration #
####################################

resource "azurerm_kubernetes_cluster" "aks" {
  name                       = "${var.resource_group}-aks"
  resource_group_name        = azurerm_resource_group.rg.name
  location                   = azurerm_resource_group.rg.location
  dns_prefix                 = "aksexercise"
  enable_pod_security_policy = true
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = var.vmSize["small"]
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "kubenet"
  }
}

