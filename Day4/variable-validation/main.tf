variable "rg_count" {
   type = number

   description = "The number of resource groups to be created in your Azure portal"

   validation {
        condition  = var.rg_count > 1 && var.rg_count <= 5
        error_message = "The rg_count should be greater 0 must be less than or equal to 5."
   }   
}

resource "azurerm_resource_group" "rg" {
  count = var.rg_count
  name = "tektutor-rg-${var.rg_count}"
  location = "eastus"
}
