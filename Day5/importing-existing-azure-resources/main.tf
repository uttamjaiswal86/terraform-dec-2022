data "azurerm_resource_group" "existing" { 
   name = "centralized-state-rg"
}

data "azurerm_virtual_machine" "existing" {
  name                = "vm1"
  resource_group_name = "centralized-state-rg"
}
