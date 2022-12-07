resource "azurerm_public_ip" "lb_public_ip" {
  name = "PublicIPForLB"
  
  resource_group_name = azurerm_resource_group.tektutor_resource_group.name
  location = azurerm_resource_group.tektutor_resource_group.location 

  allocation_method = "Static"
  sku = "Standard"
}

resource "azurerm_lb" "my_loadbalancer" {
  name = "my-load-balancer"

  resource_group_name = azurerm_resource_group.tektutor_resource_group.name
  location = azurerm_resource_group.tektutor_resource_group.location 

  sku      = "Standard"
  sku_tier = "Regional"
  
  frontend_ip_configuration {
    name = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id 
  }

  depends_on = [ 
    azurerm_public_ip.lb_public_ip
  ]
}

resource "azurerm_lb_backend_address_pool" "lb_backend" {
  name = "LBBackendAddressPool"
  loadbalancer_id = azurerm_lb.my_loadbalancer.id

  depends_on = [ 
	azurerm_lb.my_loadbalancer
  ]
}

resource "azurerm_lb_backend_address_pool_address" "vms" {
  count = var.vm_count

  name = "add-vm-${count.index}-to-lb-pool"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backend.id
  virtual_network_id = azurerm_virtual_network.my_virtual_network.id
  ip_address = azurerm_linux_virtual_machine.my_linux_vm[count.index].private_ip_address

  depends_on = [
      time_sleep.wait_120_seconds
  ]
}

resource "azurerm_lb_rule" "rule_for_forwarding_lb_port_80_traffic_to_backend_vms" {
  name = "LBRule"
  loadbalancer_id = azurerm_lb.my_loadbalancer.id

  backend_address_pool_ids = [ azurerm_lb_backend_address_pool.lb_backend.id ]
  protocol = "Tcp"
  frontend_port = 80
  backend_port = 80
  frontend_ip_configuration_name = "PublicIPAddress"

  depends_on = [
     azurerm_lb_backend_address_pool.lb_backend
  ]
}
