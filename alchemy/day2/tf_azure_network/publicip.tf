resource "azurerm_public_ip" "myterraformpublicip" {
name="myPublicIP"
location=var.location
resource_group_name = azurerm_resource_group.myterraformgroup.name
allocation_method = "Dynamic"
}
