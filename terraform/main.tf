terraform {
  backend "azurerm" {
    resource_group_name  = "prodopstfstates"
    storage_account_name = "prodopstf"
    container_name       = "tfstatedevops"
    key                  = "production_storage.tfstate"
  }
}
 
provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you're using version 1.x, the "features" block is not allowed.
  version = "~>2.0"
  features {}
}
 
data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "res-0" {
  location = "westus2"
  name     = "production_storage"
}
resource "azurerm_cdn_endpoint_custom_domain" "res-1" {
  cdn_endpoint_id = "/subscriptions/fcb20762-8b8f-4e0a-8d02-28913debf2d2/resourceGroups/production_storage/providers/Microsoft.Cdn/profiles/technoliterate-cdn/endpoints/techno-literate-cdn"
  host_name       = "resume.techno-literate.com"
  name            = "resume-techno-literate-com"
  cdn_managed_https {
    certificate_type = "Dedicated"
    protocol_type    = "ServerNameIndication"
  }
  depends_on = [
    azurerm_cdn_endpoint.res-10,
  ]
}
resource "azurerm_storage_account" "res-3" {
  account_replication_type         = "LRS"
  account_tier                     = "Standard"
  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false
  location                         = "westus2"
  name                             = "tlprodstore"
  resource_group_name              = "production_storage"
  custom_domain {
    name = "resume.techno-literate.com"
  }
  static_website {
    error_404_document = "404.html"
    index_document     = "index.html"
  }
}
resource "azurerm_storage_container" "res-5" {
  name                 = "$web"
  storage_account_name = "tlprodstore"
}
resource "azurerm_cdn_profile" "res-9" {
  location            = "global"
  name                = "technoliterate-cdn"
  resource_group_name = "production_storage"
  sku                 = "Standard_Microsoft"
}
resource "azurerm_cdn_endpoint" "res-10" {
  is_compression_enabled = true
  location               = "global"
  name                   = "techno-literate-cdn"
  origin_host_header     = "tlprodstore.z5.web.core.windows.net"
  profile_name           = "technoliterate-cdn"
  resource_group_name    = "production_storage"
  origin {
    host_name = "tlprodstore.z5.web.core.windows.net"
    name      = "default-origin-37836f6a"
  }
  depends_on = [
    azurerm_cdn_profile.res-9,
  ]
}
