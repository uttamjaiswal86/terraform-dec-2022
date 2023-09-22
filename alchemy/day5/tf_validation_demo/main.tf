resource "azurerm_resource_group" "rg" {
  name = "${var.environment}${var.suffix}robochefRG"
  # location = "westus"
  location = var.location
}
