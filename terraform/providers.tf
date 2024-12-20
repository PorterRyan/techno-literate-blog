provider "azurerm" {
  features {}
  subscription_id = "fcb20762-8b8f-4e0a-8d02-28913debf2d2"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "prodopstfstates"
    storage_account_name = "prodopstf"
    container_name       = "tfstatedevops"
    key                  = "production_storage.tfstate"
  }
}

data "azurerm_client_config" "current" {}
