resource "azurerm_resource_group" "tektutor_resource_group" {
  name     = "tektutor-resource-group"
  location = "eastus"
}

resource "azurerm_virtual_network" "my_virtual_network" {
  name = "my-virtual-network"
  resource_group_name = azurerm_resource_group.tektutor_resource_group.name
  address_space = [ "10.20.0.0/16" ]
  location = azurerm_resource_group.tektutor_resource_group.location 
  depends_on = [
	azurerm_resource_group.tektutor_resource_group
  ]
}
  
resource "azurerm_subnet" "my_subnet" {
  name = "my-subnet"
  resource_group_name = azurerm_resource_group.tektutor_resource_group.name
  virtual_network_name = azurerm_virtual_network.my_virtual_network.name 
  address_prefixes = [ "10.20.1.0/24" ] 
  depends_on = [
	azurerm_virtual_network.my_virtual_network
  ]
}

resource "azurerm_network_interface" "my_network_card" {
  name = "my-network-card"

  resource_group_name = azurerm_resource_group.tektutor_resource_group.name
  location = azurerm_resource_group.tektutor_resource_group.location 

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.my_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.my_vm_public_ip.id
  }

  depends_on = [
	azurerm_subnet.my_subnet
  ]
}

resource "azurerm_network_security_group" "my_vm_firewall" {

  name = "my-vm-firewall"

  resource_group_name = azurerm_resource_group.tektutor_resource_group.name
  location = azurerm_resource_group.tektutor_resource_group.location 

  security_rule {
    name                       = "AllowRDP"
    priority                   = 300 
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
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

  depends_on = [
	azurerm_resource_group.tektutor_resource_group
  ]
}

resource "azurerm_network_interface_security_group_association" "apply_firewall_rules_on_network_card"  {
  network_interface_id = azurerm_network_interface.my_network_card.id
  network_security_group_id = azurerm_network_security_group.my_vm_firewall.id
  depends_on = [
	azurerm_network_interface.my_network_card,
	azurerm_network_security_group.my_vm_firewall
  ]
}

resource "azurerm_public_ip" "my_vm_public_ip" {
  name = "my-vm-public-ip"
  resource_group_name = azurerm_resource_group.tektutor_resource_group.name
  location = azurerm_resource_group.tektutor_resource_group.location 
  allocation_method = "Dynamic"
  depends_on = [
	azurerm_resource_group.tektutor_resource_group
  ]
}

resource "azurerm_windows_virtual_machine" "my_windows_vm" {
  name                = "my-windows-vm"

  resource_group_name = azurerm_resource_group.tektutor_resource_group.name
  location = azurerm_resource_group.tektutor_resource_group.location 

  size                = "Standard_F2"
  admin_username      = "azureuser"
  admin_password      = "password@123"
  
  network_interface_ids = [
    azurerm_network_interface.my_network_card.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
  depends_on = [
	azurerm_network_interface.my_network_card
  ]
}

output "public_ip_address" {
  value = azurerm_windows_virtual_machine.my_windows_vm.public_ip_address
}
