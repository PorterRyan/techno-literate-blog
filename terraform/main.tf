resource "azurerm_resource_group" "res-0" {
  location = "westus2"
  name     = "production_storage"
}
resource "azurerm_cdn_endpoint_custom_domain" "res-1" {
  cdn_endpoint_id = var.endpoint_id
  host_name       = var.domain_name
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
resource "azurerm_cdn_frontdoor_profile" "res-9" {
  id                  = var.frontdoor_profile_id
  location            = "global"
  name                = "technoliterate-cdn"
  resource_group_name = "production_storage"
  sku                 = "Standard_AzureFrontDoor"
}
resource "azurerm_cdn_frontdoor_endpoint" "res-10" {
  is_compression_enabled = false
  location               = "global"
  name                   = var.frontdoor_endpoint_name
  origin_host_header     = var.endpoint_origin_hostname
  profile_name           = "technoliterate-cdn"
  resource_group_name    = "production_storage"
  origin {
    host_name = var.endpoint_origin_hostname
    name      = var.endpoint_origin_name
  }
  depends_on = [
    azurerm_cdn_frontdoor_profile.res-9,
  ]
}
