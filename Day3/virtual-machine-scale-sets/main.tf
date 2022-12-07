resource "azurerm_resource_group" "rg" {
   name = "${var.prefix}-resource-group"
   location = "${var.location}"
}

resource "azurerm_virtual_network" "network" {
    name = "${var.prefix}-network"
    
    address_space = ["10.0.0.0/16"]
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "internal" {
   name = "internal"
   resource_group_name = azurerm_resource_group.rg.name
   
   virtual_network_name = azurerm_virtual_network.network.name

   address_prefixes = ["10.0.2.0/24"]
}

resource "azurerm_linux_virtual_machine_scale_set" "machine_scale_set" {

   name = "${var.prefix}-vmss" 
   location = azurerm_resource_group.rg.location
   resource_group_name = azurerm_resource_group.rg.name

   sku = "Standard_F2"
   instances = 3
   admin_username = "azureuser"
   admin_password = "password@123"
   disable_password_authentication = false

   source_image_reference {
      publisher = "Canonical"
      offer = "UbuntuServer"
      sku = "18.04-LTS"
      version = "latest"
   }

   network_interface {
      name = "network"
      primary = true 

      ip_configuration {
         name = "internal"
         primary = true
         subnet_id = azurerm_subnet.internal.id
      }
   }

   os_disk {
      storage_account_type = "Standard_LRS"
      caching = "ReadWrite"
   }
   
}
