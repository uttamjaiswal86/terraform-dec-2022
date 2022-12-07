output "ssh_user_name" {
  value = "azureuser"
}

output "public_ip_address" {
  value = azurerm_linux_virtual_machine.my_linux_vm.*.public_ip_address
}

output "ssh_command" {
  value = "ssh -i ./key.pem azureuser@vm-public-ip"
}

output "private_key" {
  value = tls_private_key.my_key_pair.private_key_pem
  sensitive = true
}


output "lb_public_ip" {
  value = azurerm_public_ip.lb_public_ip
}
