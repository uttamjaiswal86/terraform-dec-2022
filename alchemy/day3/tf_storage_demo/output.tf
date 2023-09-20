output "rgname" {
  value = azurerm_resource_group.demorg.name
}

output "storage_account" {
  value = azurerm_storage_account.storagedemo.name
}

output "storage_container" {
  value = azurerm_storage_container.demoscontainer.name
}
