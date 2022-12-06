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
  count = 3
  name = "my-network-card-${count.index}"

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
  count = 3

  name = "my-vm-firewall-${count.index}"

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

  depends_on = [
	azurerm_resource_group.tektutor_resource_group
  ]
}

resource "azurerm_network_interface_security_group_association" "apply_firewall_rules_on_network_card"  {
  count = 3
  network_interface_id = azurerm_network_interface.my_network_card[count.index].id
  network_security_group_id = azurerm_network_security_group.my_vm_firewall[count.index].id
  depends_on = [
	azurerm_network_interface.my_network_card,
	azurerm_network_security_group.my_vm_firewall
  ]
}

resource "azurerm_public_ip" "my_vm_public_ip" {
  count = 3
  name = "my-vm-public-ip-${count.index}"
  resource_group_name = azurerm_resource_group.tektutor_resource_group.name
  location = azurerm_resource_group.tektutor_resource_group.location 
  allocation_method = "Dynamic"
  depends_on = [
	azurerm_resource_group.tektutor_resource_group
  ]
}

resource "tls_private_key" "my_key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_linux_virtual_machine" "my_linux_vm" {
  count = 3
  name                = "my-linux-vm-${count.index}"

  resource_group_name = azurerm_resource_group.tektutor_resource_group.name
  location = azurerm_resource_group.tektutor_resource_group.location 

  size                = "Standard_F2"
  admin_username      = "azureuser"
  disable_password_authentication = true
  
  network_interface_ids = [
    azurerm_network_interface.my_network_card[count.index].id
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
  depends_on = [
	azurerm_network_interface.my_network_card,
	tls_private_key.my_key_pair 
  ]
}

resource "local_file" "private_key_file" {
  content = tls_private_key.my_key_pair.private_key_pem
  filename = "./key.pem"
}

resource "null_resource" "change_private_key_file_permission" {
  provisioner "local-exec" {  
     command = "chmod 400 ./key.pem"
  }
  depends_on = [
    local_file.private_key_file
  ]
}

output "public_ip_address" {
  value = azurerm_linux_virtual_machine.my_linux_vm.*.public_ip_address
}

output "private_key" {
  value = tls_private_key.my_key_pair.private_key_pem
  sensitive = true
}
