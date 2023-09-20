output "ssh_password" {
  value = random_string.sshpassword.result
}

output "sshuser" {
value=var.ssh_user
}

output "vm_public_ip" {
  value = azurerm_public_ip.myterraformpublicip.ip_address
}
