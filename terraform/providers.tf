provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 3.90.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "prodopstfstates"
    storage_account_name = "prodopstf"
    container_name       = "tfstatedevops"
    key                  = "production_storage.tfstate"
  }
}

data "azurerm_client_config" "current" {}
