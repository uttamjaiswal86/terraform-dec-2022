resource "random_string" "rgsuffix" {
  length  = 5
  special = false
  upper   = false
}

resource "azurerm_resource_group" "demorg" {
  name = var.rgroup
  location = var.location
}

resource "random_string" "storageSuffix" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_storage_account" "storagedemo" {
  name                     = var.saname
  resource_group_name      = azurerm_resource_group.demorg.name
  location                 = var.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "robochefweb"
  }
}

resource "azurerm_storage_container" "demoscontainer" {
  name = var.scontainer
  storage_account_name  = azurerm_storage_account.storagedemo.name
  container_access_type = "private"
}
