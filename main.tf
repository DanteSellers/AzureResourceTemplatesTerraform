terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.14.0"
    }
  }

  #running this after creation of resources
  /*
     backend "azurerm" {
        resource_group_name  = "tfrg"
        storage_account_name = "tfsa700001"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
    }*/
}


provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {
}