resource "random_string" "storageSuffix" {
  length  = 6
  special = false
  upper   = false
}


resource "azurerm_storage_account" "storagedemo" {
  name                     = "mystorage${random_string.storageSuffix.result}"
  resource_group_name      = azurerm_resource_group.demorg.name
  location                 = var.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "robochefweb"
  }
}

resource "azurerm_storage_container" "demoscontainer" {
  name = "myscontainer2023${random_string.storageSuffix.result}"
  storage_account_name  = azurerm_storage_account.storagedemo.name
  container_access_type = "private"
}


resource "azurerm_storage_blob" "mydata" {
  name                   = "mydata.csv"
  storage_account_name   = azurerm_storage_account.storagedemo.name
  storage_container_name = azurerm_storage_container.demoscontainer.name
  type                   = "Block"
  source                 = "data.csv"
}
