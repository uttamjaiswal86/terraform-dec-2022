resource "azurerm_resource_group" "rg" {
    location = "eastus" 
    name = "centralized-state-rg" 
}

resource "azurerm_storage_account" "tfstate" {
   name = "jegantfstate"

   location = azurerm_resource_group.rg.location 
   resource_group_name = azurerm_resource_group.rg.name

   account_tier = "Standard"
   account_replication_type = "LRS"

   depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_storage_container" "tfstate" {
   name = "jegantfstate"
   storage_account_name = azurerm_storage_account.tfstate.name
   container_access_type = "blob"
   
   depends_on = [azurerm_storage_account.tfstate]
}

resource "null_resource" "allow-sharedkey-access" {
  provisioner "local-exec" {
    command = "az resource update --ids ${azurerm_storage_account.tfstate.id} --set properties.allowSharedKeyAccess=true"
  }

  depends_on = [
	azurerm_storage_container.tfstate
  ]
}
