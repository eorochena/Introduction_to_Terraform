######################
# Configure Provider #
######################

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.87.0"
    }
  }
}

############
# Provider #
############

provider "azurerm" {
  features {}
}

