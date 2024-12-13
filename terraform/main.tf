resource "azurerm_resource_group" "res-0" {
  location = "westus2"
  name     = "production_storage"
}
resource "azurerm_storage_account" "res-1" {
  account_replication_type         = "LRS"
  account_tier                     = "Standard"
  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false
  location                         = azurerm_resource_group.res-0.location
  name                             = "tlprodstore"
  resource_group_name              = azurerm_resource_group.res-0.name

  custom_domain {
    name = "www.techno-literate.com"
  }

  static_website {
    error_404_document = "404.html"
    index_document     = "index.html"
  }
  depends_on = [
    azurerm_resource_group.res-0,
  ]
}

import {
  to = azurerm_storage_container.res-3
  id = "https://tlprodstore.z5.blob.core.windows.net/$web"
}

resource "azurerm_storage_container" "res-3" {
  name                 = "$web"
  storage_account_name = "tlprodstore"
}