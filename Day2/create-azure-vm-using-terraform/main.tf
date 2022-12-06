resource "azurerm_resource_group" "tektutor_resource_group" {
  name     = "tektutor-resource-group"
  location = "eastus"
}

resource "azurerm_virtual_network" "my_virtual_network" {
  name = "my-virtual-network"
  resource_group_name = azurerm_resource_group.tektutor_resource_group.name
  address_space = [ "10.20.0.0/16" ]
  location = azurerm_resource_group.tektutor_resource_group.location 
}
  
resource "azurerm_subnet" "my_subnet" {
  name = "my-subnet"
  resource_group_name = azurerm_resource_group.tektutor_resource_group.name
  virtual_network_name = azurerm_virtual_network.my_virtual_network.name 
  address_prefixes = [ "10.20.1.0/24" ] 
}

resource "azurerm_network_interface" "my_network_card" {
  name = "my-network-card"

  resource_group_name = azurerm_resource_group.tektutor_resource_group.name
  location = azurerm_resource_group.tektutor_resource_group.location 

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.my_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_security_group" "my_vm_firewall" {

  name = "my-vm-firewall"

  resource_group_name = azurerm_resource_group.tektutor_resource_group.name
  location = azurerm_resource_group.tektutor_resource_group.location 

  security_rule {
    name                       = "AllowSSH"
    priority                   = 300 
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowICMP"
    priority                   = 310 
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Icmp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowHttp"
    priority                   = 320 
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "apply_firewall_rules_on_network_card"  {
   network_interface_id = azurerm_network_interface.my_network_card.id
   network_security_group_id = azurerm_network_security_group.my_vm_firewall.id
}

resource "azurerm_public_ip" "my_vm_public_ip" {
  name = "my-vm-public-ip"
  resource_group_name = azurerm_resource_group.tektutor_resource_group.name
  location = azurerm_resource_group.tektutor_resource_group.location 
  allocation_method = "Dynamic"
}

resource "tls_private_key" "my_key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_linux_virtual_machine" "my_linux_vm" {
  name                = "my-linux-vm"

  resource_group_name = azurerm_resource_group.tektutor_resource_group.name
  location = azurerm_resource_group.tektutor_resource_group.location 

  size                = "Standard_F2"
  admin_username      = "azureuser"
  disable_password_authentication = true
  
  network_interface_ids = [
    azurerm_network_interface.my_network_card.id
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.my_key_pair.public_key_openssh 
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
