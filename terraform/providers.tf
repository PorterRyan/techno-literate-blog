provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = var.state_resource_group_name
    storage_account_name = var.state_storage_account_name
    container_name       = "tfstatedevops"
    key                  = "production_storage.tfstate"
  }
}

data "azurerm_client_config" "current" {}
