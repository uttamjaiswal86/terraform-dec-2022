resource "random_string" "rgsuffix" {
  length  = 5
  special = false
  upper   = false
}

resource "azurerm_resource_group" "demorg" {
  name = "rgstorage${random_string.rgsuffix.result}"
  location = var.location
}
