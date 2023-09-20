resource "azurerm_resource_group" "myterraformgroup" {
  name     = "admatic-rg-network-demo"
  location = var.location
}

resource "azurerm_virtual_network" "myterraformnetwork" {
  name                = "myd3Vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.myterraformgroup.name
}

resource "azurerm_subnet" "myterraformsubnet" {
  name                 = "myd3Subnnet"
  resource_group_name  = azurerm_resource_group.myterraformgroup.name
  virtual_network_name = azurerm_virtual_network.myterraformnetwork.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "myterraformnsg" {
  name                = "myd3NetworkSecurityGroup"
  location            = var.location
  resource_group_name = azurerm_resource_group.myterraformgroup.name

  security_rule {
    name                       = "Web"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = var.ssh_port
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "myterraformnic" {
  name                = "myd3NIC"
  location            = var.location
  resource_group_name = azurerm_resource_group.myterraformgroup.name

  ip_configuration {
    name                          = "myd3NicConfiguration"
    subnet_id                     = azurerm_subnet.myterraformsubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id        = azurerm_public_ip.myterraformpublicip.id
  }
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.myterraformnic.id
  network_security_group_id = azurerm_network_security_group.myterraformnsg.id
}

resource "azurerm_public_ip" "myterraformpublicip" {
  name                = "myd3PublicIP"
  location            = var.location
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  allocation_method   = "Dynamic"

}

resource "azurerm_linux_virtual_machine" "myterraformvm" {
  name                  = "myd3AdmaticVM"
  location              = var.location
  resource_group_name   = azurerm_resource_group.myterraformgroup.name
  network_interface_ids = [azurerm_network_interface.myterraformnic.id]

  size = "Standard_B2s"

  os_disk {
    name                 = "myd3OsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  admin_username                  = "uttamjaiswal86"
  admin_password                  = random_string.sshpassword.result
  disable_password_authentication = false
}

resource "random_string" "sshpassword" {
  length  = 20
  special = true
}
resource "random_string" "rgprefix" {
   length = "9"
   special = false
}

resource "random_string" "vm_prefix" {
  length  = 6
  special = false
}
