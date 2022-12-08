variable "names" {
   type = list(string)
   default = [ "tektutor-resource-group1", "tektutor-resource-group2", "tektutor-resource-group3" ]
}


resource "azurerm_resource_group" "rg" {
  for_each = toset( var.names )
  name = each.key
  location = "eastus" 
}
