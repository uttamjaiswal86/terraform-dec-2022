# Day 2

# Configuring terraform to access Azure portal via az command line tool
```
az login --use-device-code
```
The above command will display an URL and a code.  You can launch the URL in your web browser and paste the code displayed in the command line.

Make sure, when you login to azure portal with the azure account credentials you created yesterday for this training.

## ⛹️‍♂️ Lab - Creating a Resource group in azure using Terraform
```
cd ~/terraform-dec-2022
git pull

cd Day2/create-azure-resource-group-using-terraform
terraform init
terraform apply
```

Expected output
<pre>
jegan@ubuntu:~/terraform-dec-2022/Day2/create-azure-resource-group-using-terraform$ <b>terraform init</b>

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/azurerm versions matching "3.34.0"...
- Installing hashicorp/azurerm v3.34.0...
- Installed hashicorp/azurerm v3.34.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.


jegan@ubuntu:~/terraform-dec-2022/Day2/create-azure-resource-group-using-terraform$ <b>terraform apply --auto-approve</b>

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_resource_group.tektutor_resource_group will be created
  + resource "azurerm_resource_group" "tektutor_resource_group" {
      + id       = (known after apply)
      + location = "eastus"
      + name     = "tektutor-resource-group"
    }

Plan: 1 to add, 0 to change, 0 to destroy.
azurerm_resource_group.tektutor_resource_group: Creating...
azurerm_resource_group.tektutor_resource_group: Creation complete after 8s [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
</pre>



#### Delete all the resources created by terraform
```
terraform destroy --auto-approve
```

Expected output
<pre>
jegan@ubuntu:~/terraform-dec-2022/Day2/create-azure-resource-group-using-terraform$ <b>terraform destroy --auto-approve</b>
azurerm_resource_group.tektutor_resource_group: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
the following symbols:
  - destroy

Terraform will perform the following actions:

  # azurerm_resource_group.tektutor_resource_group will be destroyed
  - resource "azurerm_resource_group" "tektutor_resource_group" {
      - id       = "/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group" -> null
      - location = "eastus" -> null
      - name     = "tektutor-resource-group" -> null
      - tags     = {} -> null
    }

Plan: 0 to add, 0 to change, 1 to destroy.
azurerm_resource_group.tektutor_resource_group: Destroying... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group]
azurerm_resource_group.tektutor_resource_group: Still destroying... [id=/subscriptions/9eb2e122-36af-4b34-9186-...resourceGroups/tektutor-resource-group, 10s elapsed]
azurerm_resource_group.tektutor_resource_group: Destruction complete after 1m27s

Destroy complete! Resources: 1 destroyed.
</pre>


## ⛹️‍♀️ Lab - Creating an Azure Virtual machine using Terraform
```
cd ~/terraform-dec-2022
git pull
cd Day2/create-azure-vm-using-terraform
terraform init
terraform validate
terraform apply --auto-approve
```

Expected output
<pre>
jegan@ubuntu:~/terraform-dec-2022/Day2/create-azure-vm-using-terraform$ <b>terraform init</b>

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/azurerm versions matching "3.34.0"...
- Finding latest version of hashicorp/tls...
- Installing hashicorp/azurerm v3.34.0...
- Installed hashicorp/azurerm v3.34.0 (signed by HashiCorp)
- Installing hashicorp/tls v4.0.4...
- Installed hashicorp/tls v4.0.4 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

jegan@ubuntu:~/terraform-dec-2022/Day2/create-azure-vm-using-terraform$ terraform validate
Success! The configuration is valid.

jegan@ubuntu:~/terraform-dec-2022/Day2/create-azure-vm-using-terraform$ terraform apply --auto-approve


Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_linux_virtual_machine.my_linux_vm will be created
  + resource "azurerm_linux_virtual_machine" "my_linux_vm" {
      + admin_username                  = "azureuser"
      + allow_extension_operations      = true
      + computer_name                   = (known after apply)
      + disable_password_authentication = true
      + extensions_time_budget          = "PT1H30M"
      + id                              = (known after apply)
      + location                        = "eastus"
      + max_bid_price                   = -1
      + name                            = "my-linux-vm"
      + network_interface_ids           = (known after apply)
      + patch_assessment_mode           = "ImageDefault"
      + patch_mode                      = "ImageDefault"
      + platform_fault_domain           = -1
      + priority                        = "Regular"
      + private_ip_address              = (known after apply)
      + private_ip_addresses            = (known after apply)
      + provision_vm_agent              = true
      + public_ip_address               = (known after apply)
      + public_ip_addresses             = (known after apply)
      + resource_group_name             = "tektutor-resource-group"
      + size                            = "Standard_F2"
      + virtual_machine_id              = (known after apply)

      + admin_ssh_key {
          + public_key = (known after apply)
          + username   = "azureuser"
        }

      + os_disk {
          + caching                   = "ReadWrite"
          + disk_size_gb              = (known after apply)
          + name                      = (known after apply)
          + storage_account_type      = "Standard_LRS"
          + write_accelerator_enabled = false
        }

      + source_image_reference {
          + offer     = "UbuntuServer"
          + publisher = "Canonical"
          + sku       = "18.04-LTS"
          + version   = "latest"
        }

      + termination_notification {
          + enabled = (known after apply)
          + timeout = (known after apply)
        }
    }

  # azurerm_network_interface.my_network_card will be created
  + resource "azurerm_network_interface" "my_network_card" {
      + applied_dns_servers           = (known after apply)
      + dns_servers                   = (known after apply)
      + enable_accelerated_networking = false
      + enable_ip_forwarding          = false
      + id                            = (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
      + location                      = "eastus"
      + mac_address                   = (known after apply)
      + name                          = "my-network-card"
      + private_ip_address            = (known after apply)
      + private_ip_addresses          = (known after apply)
      + resource_group_name           = "tektutor-resource-group"
      + virtual_machine_id            = (known after apply)

      + ip_configuration {
          + gateway_load_balancer_frontend_ip_configuration_id = (known after apply)
          + name                                               = "internal"
          + primary                                            = (known after apply)
          + private_ip_address                                 = (known after apply)
          + private_ip_address_allocation                      = "Dynamic"
          + private_ip_address_version                         = "IPv4"
          + subnet_id                                          = (known after apply)
        }
    }

  # azurerm_network_interface_security_group_association.apply_firewall_rules_on_network_card will be created
  + resource "azurerm_network_interface_security_group_association" "apply_firewall_rules_on_network_card" {
      + id                        = (known after apply)
      + network_interface_id      = (known after apply)
      + network_security_group_id = (known after apply)
    }

  # azurerm_network_security_group.my_vm_firewall will be created
  + resource "azurerm_network_security_group" "my_vm_firewall" {
      + id                  = (known after apply)
      + location            = "eastus"
      + name                = "my-vm-firewall"
      + resource_group_name = "tektutor-resource-group"
      + security_rule       = [
          + {
              + access                                     = "Allow"
              + description                                = ""
              + destination_address_prefix                 = "*"
              + destination_address_prefixes               = []
              + destination_application_security_group_ids = []
              + destination_port_range                     = "*"
              + destination_port_ranges                    = []
              + direction                                  = "Inbound"
              + name                                       = "AllowICMP"
              + priority                                   = 310
              + protocol                                   = "Icmp"
              + source_address_prefix                      = "*"
              + source_address_prefixes                    = []
              + source_application_security_group_ids      = []
              + source_port_range                          = "*"
              + source_port_ranges                         = []
            },
          + {
              + access                                     = "Allow"
              + description                                = ""
              + destination_address_prefix                 = "*"
              + destination_address_prefixes               = []
              + destination_application_security_group_ids = []
              + destination_port_range                     = "22"
              + destination_port_ranges                    = []
              + direction                                  = "Inbound"
              + name                                       = "AllowSSH"
              + priority                                   = 300
              + protocol                                   = "Tcp"
              + source_address_prefix                      = "*"
              + source_address_prefixes                    = []
              + source_application_security_group_ids      = []
              + source_port_range                          = "*"
              + source_port_ranges                         = []
            },
          + {
              + access                                     = "Allow"
              + description                                = ""
              + destination_address_prefix                 = "*"
              + destination_address_prefixes               = []
              + destination_application_security_group_ids = []
              + destination_port_range                     = "80"
              + destination_port_ranges                    = []
              + direction                                  = "Inbound"
              + name                                       = "AllowHttp"
              + priority                                   = 320
              + protocol                                   = "Tcp"
              + source_address_prefix                      = "*"
              + source_address_prefixes                    = []
              + source_application_security_group_ids      = []
              + source_port_range                          = "*"
              + source_port_ranges                         = []
            },
        ]
    }

  # azurerm_public_ip.my_vm_public_ip will be created
  + resource "azurerm_public_ip" "my_vm_public_ip" {
      + allocation_method       = "Dynamic"
      + ddos_protection_mode    = "VirtualNetworkInherited"
      + fqdn                    = (known after apply)
      + id                      = (known after apply)
      + idle_timeout_in_minutes = 4
      + ip_address              = (known after apply)
      + ip_version              = "IPv4"
      + location                = "eastus"
      + name                    = "my-vm-public-ip"
      + resource_group_name     = "tektutor-resource-group"
      + sku                     = "Basic"
      + sku_tier                = "Regional"
    }

  # azurerm_resource_group.tektutor_resource_group will be created
  + resource "azurerm_resource_group" "tektutor_resource_group" {
      + id       = (known after apply)
      + location = "eastus"
      + name     = "tektutor-resource-group"
    }

  # azurerm_subnet.my_subnet will be created
  + resource "azurerm_subnet" "my_subnet" {
      + address_prefixes                               = [
          + "10.20.1.0/24",
        ]
      + enforce_private_link_endpoint_network_policies = (known after apply)
      + enforce_private_link_service_network_policies  = (known after apply)
      + id                                             = (known after apply)
      + name                                           = "my-subnet"
      + private_endpoint_network_policies_enabled      = (known after apply)
      + private_link_service_network_policies_enabled  = (known after apply)
      + resource_group_name                            = "tektutor-resource-group"
      + virtual_network_name                           = "my-virtual-network"
    }

  # azurerm_virtual_network.my_virtual_network will be created
  + resource "azurerm_virtual_network" "my_virtual_network" {
      + address_space       = [
          + "10.20.0.0/16",
        ]
      + dns_servers         = (known after apply)
      + guid                = (known after apply)
      + id                  = (known after apply)
      + location            = "eastus"
      + name                = "my-virtual-network"
      + resource_group_name = "tektutor-resource-group"
      + subnet              = (known after apply)
    }

  # tls_private_key.my_key_pair will be created
  + resource "tls_private_key" "my_key_pair" {
      + algorithm                     = "RSA"
      + ecdsa_curve                   = "P224"
      + id                            = (known after apply)
      + private_key_openssh           = (sensitive value)
      + private_key_pem               = (sensitive value)
      + private_key_pem_pkcs8         = (sensitive value)
      + public_key_fingerprint_md5    = (known after apply)
      + public_key_fingerprint_sha256 = (known after apply)
      + public_key_openssh            = (known after apply)
      + public_key_pem                = (known after apply)
      + rsa_bits                      = 4096
    }

Plan: 9 to add, 0 to change, 0 to destroy.
tls_private_key.my_key_pair: Creating...
tls_private_key.my_key_pair: Creation complete after 1s [id=c1756a3c2af5d7b4809685133371feb85bd8ac73]
azurerm_resource_group.tektutor_resource_group: Creating...
azurerm_resource_group.tektutor_resource_group: Creation complete after 4s [id=/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group]
azurerm_virtual_network.my_virtual_network: Creating...
azurerm_public_ip.my_vm_public_ip: Creating...
azurerm_network_security_group.my_vm_firewall: Creating...
azurerm_public_ip.my_vm_public_ip: Creation complete after 9s [id=/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/publicIPAddresses/my-vm-public-ip]
azurerm_virtual_network.my_virtual_network: Still creating... [10s elapsed]
azurerm_network_security_group.my_vm_firewall: Still creating... [10s elapsed]
azurerm_network_security_group.my_vm_firewall: Creation complete after 12s [id=/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/networkSecurityGroups/my-vm-firewall]
azurerm_virtual_network.my_virtual_network: Creation complete after 12s [id=/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/virtualNetworks/my-virtual-network]
azurerm_subnet.my_subnet: Creating...
azurerm_subnet.my_subnet: Still creating... [10s elapsed]
azurerm_subnet.my_subnet: Creation complete after 11s [id=/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/virtualNetworks/my-virtual-network/subnets/my-subnet]
azurerm_network_interface.my_network_card: Creating...
azurerm_network_interface.my_network_card: Creation complete after 7s [id=/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/networkInterfaces/my-network-card]
azurerm_network_interface_security_group_association.apply_firewall_rules_on_network_card: Creating...
azurerm_linux_virtual_machine.my_linux_vm: Creating...
azurerm_network_interface_security_group_association.apply_firewall_rules_on_network_card: Creation complete after 3s [id=/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/networkInterfaces/my-network-card|/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/networkSecurityGroups/my-vm-firewall]
azurerm_linux_virtual_machine.my_linux_vm: Still creating... [10s elapsed]
azurerm_linux_virtual_machine.my_linux_vm: Creation complete after 1m3s [id=/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Compute/virtualMachines/my-linux-vm]

Apply complete! Resources: 9 added, 0 changed, 0 destroyed.
</pre>

### Destroy all resources created by Terraform
```
cd ~/terraform-dec-2022
git pull
cd Day2/create-azure-vm-using-terraform
terraform init
terraform destroy --auto-approve
```

Expected outupt
<pre>
jegan@ubuntu:~/terraform-dec-2022/Day2/create-azure-vm-using-terraform$ <b>terraform destroy --auto-approve</b>
tls_private_key.my_key_pair: Refreshing state... [id=c1756a3c2af5d7b4809685133371feb85bd8ac73]
azurerm_resource_group.tektutor_resource_group: Refreshing state... [id=/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group]
azurerm_virtual_network.my_virtual_network: Refreshing state... [id=/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/virtualNetworks/my-virtual-network]
azurerm_public_ip.my_vm_public_ip: Refreshing state... [id=/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/publicIPAddresses/my-vm-public-ip]
azurerm_network_security_group.my_vm_firewall: Refreshing state... [id=/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/networkSecurityGroups/my-vm-firewall]
azurerm_subnet.my_subnet: Refreshing state... [id=/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/virtualNetworks/my-virtual-network/subnets/my-subnet]
azurerm_network_interface.my_network_card: Refreshing state... [id=/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/networkInterfaces/my-network-card]
azurerm_network_interface_security_group_association.apply_firewall_rules_on_network_card: Refreshing state... [id=/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/networkInterfaces/my-network-card|/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/networkSecurityGroups/my-vm-firewall]
azurerm_linux_virtual_machine.my_linux_vm: Refreshing state... [id=/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Compute/virtualMachines/my-linux-vm]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
the following symbols:
  - destroy

Terraform will perform the following actions:

  # azurerm_linux_virtual_machine.my_linux_vm will be destroyed
  - resource "azurerm_linux_virtual_machine" "my_linux_vm" {
      - admin_username                  = "azureuser" -> null
      - allow_extension_operations      = true -> null
      - computer_name                   = "my-linux-vm" -> null
      - disable_password_authentication = true -> null
      - encryption_at_host_enabled      = false -> null
      - extensions_time_budget          = "PT1H30M" -> null
      - id                              = "/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Compute/virtualMachines/my-linux-vm" -> null
      - location                        = "eastus" -> null
      - max_bid_price                   = -1 -> null
      - name                            = "my-linux-vm" -> null
      - network_interface_ids           = [
          - "/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/networkInterfaces/my-network-card",
        ] -> null
      - patch_assessment_mode           = "ImageDefault" -> null
      - patch_mode                      = "ImageDefault" -> null
      - platform_fault_domain           = -1 -> null
      - priority                        = "Regular" -> null
      - private_ip_address              = "10.20.1.4" -> null
      - private_ip_addresses            = [
          - "10.20.1.4",
        ] -> null
      - provision_vm_agent              = true -> null
      - public_ip_addresses             = [] -> null
      - resource_group_name             = "tektutor-resource-group" -> null
      - secure_boot_enabled             = false -> null
      - size                            = "Standard_F2" -> null
      - tags                            = {} -> null
      - virtual_machine_id              = "75d20cf2-695e-47ea-99cc-38e2127a4e3c" -> null
      - vtpm_enabled                    = false -> null

      - admin_ssh_key {
          - public_key = <<-EOT
                ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDjiHcA4Y2f0I+/bTJ9lAk9jwagkmmP945rsBUqFJ/k8xFt3b9+2wQ9vnsw8QFw2LsyJOqILX7KuHEzeaQuwcPQIw4b8Qxvt9exK17dFGn6yjss9+UlORIkog0AR7TOQuheGYUrlmM0Wgsb4WadiXHi93I7wuPwth9RVC3fJ3jt9Mo0pxqyB880lVmvNiZ6Ry8FIBABT5y/WVXB7AUdg2mqmZCJ1ATAdYB5zbkEe0t5XzjaMXlDWkMKMfG6E16m9DpY7qMsZUaxDPVO+GGVZ1oXYsggppqJd6NzX6FZgFhDIFUj/byRGpaMjCFgXPaaVYNYFQkMe7+TeS8oS80BlxssQl17vkle2PgxapUJWZpe8wY2hClGHjNS/hgg/UQexP5UmRXSpWKs2jfaimLnuhIE4IDJPNG1T7oYW9RGjmgtpzHWS1oTTHzfdbAoNo1lLmkeuXlc2cecMy9/lCWTqoFTvJ1G5FmYb4SEkN64m7n/q5zLpPtzY+ZSfRG23/mxMcxzuwCoRctsnB3dnsIlzVG9UYqG6x71Tc9QP7Zb2MukWRV2/lhIiRr6n/BmVCqR1nSrul6ek/3pYGc9c2SOcqFwUwNtG4TgjTBTPBPIVeDqVwcag3uHnUBfaGZee1irNRQ+/a6I+9tUFf9nW4ZC1J2bgdQuyHU8UtzKg812k9BXuQ==
            EOT -> null
          - username   = "azureuser" -> null
        }

      - os_disk {
          - caching                   = "ReadWrite" -> null
          - disk_size_gb              = 30 -> null
          - name                      = "my-linux-vm_OsDisk_1_5095bbd445354230937cafd5dda8b06c" -> null
          - storage_account_type      = "Standard_LRS" -> null
          - write_accelerator_enabled = false -> null
        }

      - source_image_reference {
          - offer     = "UbuntuServer" -> null
          - publisher = "Canonical" -> null
          - sku       = "18.04-LTS" -> null
          - version   = "latest" -> null
        }
    }

  # azurerm_network_interface.my_network_card will be destroyed
  - resource "azurerm_network_interface" "my_network_card" {
      - applied_dns_servers           = [] -> null
      - dns_servers                   = [] -> null
      - enable_accelerated_networking = false -> null
      - enable_ip_forwarding          = false -> null
      - id                            = "/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/networkInterfaces/my-network-card" -> null
      - internal_domain_name_suffix   = "q1az2rmkmaiuhnbes3fhhvd4mb.bx.internal.cloudapp.net" -> null
      - location                      = "eastus" -> null
      - mac_address                   = "60-45-BD-EB-27-63" -> null
      - name                          = "my-network-card" -> null
      - private_ip_address            = "10.20.1.4" -> null
      - private_ip_addresses          = [
          - "10.20.1.4",
        ] -> null
      - resource_group_name           = "tektutor-resource-group" -> null
      - tags                          = {} -> null
      - virtual_machine_id            = "/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Compute/virtualMachines/my-linux-vm" -> null

      - ip_configuration {
          - name                          = "internal" -> null
          - primary                       = true -> null
          - private_ip_address            = "10.20.1.4" -> null
          - private_ip_address_allocation = "Dynamic" -> null
          - private_ip_address_version    = "IPv4" -> null
          - subnet_id                     = "/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/virtualNetworks/my-virtual-network/subnets/my-subnet" -> null
        }
    }

  # azurerm_network_interface_security_group_association.apply_firewall_rules_on_network_card will be destroyed
  - resource "azurerm_network_interface_security_group_association" "apply_firewall_rules_on_network_card" {
      - id                        = "/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/networkInterfaces/my-network-card|/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/networkSecurityGroups/my-vm-firewall" -> null
      - network_interface_id      = "/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/networkInterfaces/my-network-card" -> null
      - network_security_group_id = "/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/networkSecurityGroups/my-vm-firewall" -> null
    }

  # azurerm_network_security_group.my_vm_firewall will be destroyed
  - resource "azurerm_network_security_group" "my_vm_firewall" {
      - id                  = "/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/networkSecurityGroups/my-vm-firewall" -> null
      - location            = "eastus" -> null
      - name                = "my-vm-firewall" -> null
      - resource_group_name = "tektutor-resource-group" -> null
      - security_rule       = [
          - {
              - access                                     = "Allow"
              - description                                = ""
              - destination_address_prefix                 = "*"
              - destination_address_prefixes               = []
              - destination_application_security_group_ids = []
              - destination_port_range                     = "*"
              - destination_port_ranges                    = []
              - direction                                  = "Inbound"
              - name                                       = "AllowICMP"
              - priority                                   = 310
              - protocol                                   = "Icmp"
              - source_address_prefix                      = "*"
              - source_address_prefixes                    = []
              - source_application_security_group_ids      = []
              - source_port_range                          = "*"
              - source_port_ranges                         = []
            },
          - {
              - access                                     = "Allow"
              - description                                = ""
              - destination_address_prefix                 = "*"
              - destination_address_prefixes               = []
              - destination_application_security_group_ids = []
              - destination_port_range                     = "22"
              - destination_port_ranges                    = []
              - direction                                  = "Inbound"
              - name                                       = "AllowSSH"
              - priority                                   = 300
              - protocol                                   = "Tcp"
              - source_address_prefix                      = "*"
              - source_address_prefixes                    = []
              - source_application_security_group_ids      = []
              - source_port_range                          = "*"
              - source_port_ranges                         = []
            },
          - {
              - access                                     = "Allow"
              - description                                = ""
              - destination_address_prefix                 = "*"
              - destination_address_prefixes               = []
              - destination_application_security_group_ids = []
              - destination_port_range                     = "80"
              - destination_port_ranges                    = []
              - direction                                  = "Inbound"
              - name                                       = "AllowHttp"
              - priority                                   = 320
              - protocol                                   = "Tcp"
              - source_address_prefix                      = "*"
              - source_address_prefixes                    = []
              - source_application_security_group_ids      = []
              - source_port_range                          = "*"
              - source_port_ranges                         = []
            },
        ] -> null
      - tags                = {} -> null
    }

  # azurerm_public_ip.my_vm_public_ip will be destroyed
  - resource "azurerm_public_ip" "my_vm_public_ip" {
      - allocation_method       = "Dynamic" -> null
      - ddos_protection_mode    = "VirtualNetworkInherited" -> null
      - id                      = "/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/publicIPAddresses/my-vm-public-ip" -> null
      - idle_timeout_in_minutes = 4 -> null
      - ip_tags                 = {} -> null
      - ip_version              = "IPv4" -> null
      - location                = "eastus" -> null
      - name                    = "my-vm-public-ip" -> null
      - resource_group_name     = "tektutor-resource-group" -> null
      - sku                     = "Basic" -> null
      - sku_tier                = "Regional" -> null
      - tags                    = {} -> null
      - zones                   = [] -> null
    }

  # azurerm_resource_group.tektutor_resource_group will be destroyed
  - resource "azurerm_resource_group" "tektutor_resource_group" {
      - id       = "/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group" -> null
      - location = "eastus" -> null
      - name     = "tektutor-resource-group" -> null
      - tags     = {} -> null
    }

  # azurerm_subnet.my_subnet will be destroyed
  - resource "azurerm_subnet" "my_subnet" {
      - address_prefixes                               = [
          - "10.20.1.0/24",
        ] -> null
      - enforce_private_link_endpoint_network_policies = false -> null
      - enforce_private_link_service_network_policies  = false -> null
      - id                                             = "/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/virtualNetworks/my-virtual-network/subnets/my-subnet" -> null
      - name                                           = "my-subnet" -> null
      - private_endpoint_network_policies_enabled      = true -> null
      - private_link_service_network_policies_enabled  = true -> null
      - resource_group_name                            = "tektutor-resource-group" -> null
      - service_endpoint_policy_ids                    = [] -> null
      - service_endpoints                              = [] -> null
      - virtual_network_name                           = "my-virtual-network" -> null
    }

  # azurerm_virtual_network.my_virtual_network will be destroyed
  - resource "azurerm_virtual_network" "my_virtual_network" {
      - address_space           = [
          - "10.20.0.0/16",
        ] -> null
      - dns_servers             = [] -> null
      - flow_timeout_in_minutes = 0 -> null
      - guid                    = "459ec186-608a-4311-b424-974a73d47e61" -> null
      - id                      = "/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/virtualNetworks/my-virtual-network" -> null
      - location                = "eastus" -> null
      - name                    = "my-virtual-network" -> null
      - resource_group_name     = "tektutor-resource-group" -> null
      - subnet                  = [
          - {
              - address_prefix = "10.20.1.0/24"
              - id             = "/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/virtualNetworks/my-virtual-network/subnets/my-subnet"
              - name           = "my-subnet"
              - security_group = ""
            },
        ] -> null
      - tags                    = {} -> null
    }

  # tls_private_key.my_key_pair will be destroyed
  - resource "tls_private_key" "my_key_pair" {
      - algorithm                     = "RSA" -> null
      - ecdsa_curve                   = "P224" -> null
      - id                            = "c1756a3c2af5d7b4809685133371feb85bd8ac73" -> null
      - private_key_openssh           = (sensitive value)
      - private_key_pem               = (sensitive value)
      - private_key_pem_pkcs8         = (sensitive value)
      - public_key_fingerprint_md5    = "03:d6:70:17:a9:6a:37:8e:ce:72:55:8d:d6:25:cd:9c" -> null
      - public_key_fingerprint_sha256 = "SHA256:NGDndhgNRQ6CDIttoXAIBqDp6Wmak8mtuXjhH/rTZLE" -> null
      - public_key_openssh            = <<-EOT
            ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDjiHcA4Y2f0I+/bTJ9lAk9jwagkmmP945rsBUqFJ/k8xFt3b9+2wQ9vnsw8QFw2LsyJOqILX7KuHEzeaQuwcPQIw4b8Qxvt9exK17dFGn6yjss9+UlORIkog0AR7TOQuheGYUrlmM0Wgsb4WadiXHi93I7wuPwth9RVC3fJ3jt9Mo0pxqyB880lVmvNiZ6Ry8FIBABT5y/WVXB7AUdg2mqmZCJ1ATAdYB5zbkEe0t5XzjaMXlDWkMKMfG6E16m9DpY7qMsZUaxDPVO+GGVZ1oXYsggppqJd6NzX6FZgFhDIFUj/byRGpaMjCFgXPaaVYNYFQkMe7+TeS8oS80BlxssQl17vkle2PgxapUJWZpe8wY2hClGHjNS/hgg/UQexP5UmRXSpWKs2jfaimLnuhIE4IDJPNG1T7oYW9RGjmgtpzHWS1oTTHzfdbAoNo1lLmkeuXlc2cecMy9/lCWTqoFTvJ1G5FmYb4SEkN64m7n/q5zLpPtzY+ZSfRG23/mxMcxzuwCoRctsnB3dnsIlzVG9UYqG6x71Tc9QP7Zb2MukWRV2/lhIiRr6n/BmVCqR1nSrul6ek/3pYGc9c2SOcqFwUwNtG4TgjTBTPBPIVeDqVwcag3uHnUBfaGZee1irNRQ+/a6I+9tUFf9nW4ZC1J2bgdQuyHU8UtzKg812k9BXuQ==
        EOT -> null
      - public_key_pem                = <<-EOT
            -----BEGIN PUBLIC KEY-----
            MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA44h3AOGNn9CPv20yfZQJ
            PY8GoJJpj/eOa7AVKhSf5PMRbd2/ftsEPb57MPEBcNi7MiTqiC1+yrhxM3mkLsHD
            0CMOG/EMb7fXsSte3RRp+so7LPflJTkSJKINAEe0zkLoXhmFK5ZjNFoLG+FmnYlx
            4vdyO8Lj8LYfUVQt3yd47fTKNKcasgfPNJVZrzYmekcvBSAQAU+cv1lVwewFHYNp
            qpmQidQEwHWAec25BHtLeV842jF5Q1pDCjHxuhNepvQ6WO6jLGVGsQz1TvhhlWda
            F2LIIKaaiXejc1+hWYBYQyBVI/28kRqWjIwhYFz2mlWDWBUJDHu/k3kvKEvNAZcb
            LEJde75JXtj4MWqVCVmaXvMGNoQpRh4zUv4YIP1EHsT+VJkV0qVirNo32opi57oS
            BOCAyTzRtU+6GFvURo5oLacx1ktaE0x833WwKDaNZS5pHrl5XNnHnDMvf5Qlk6qB
            U7ydRuRZmG+EhJDeuJu5/6ucy6T7c2PmUn0Rtt/5sTHMc7sAqEXLbJwd3Z7CJc1R
            vVGKhuse9U3PUD+2W9jLpFkVdv5YSIka+p/wZlQqkdZ0q7penpP96WBnPXNkjnKh
            cFMDbRuE4I0wUzwTyFXg6lcHGoN7h51AX2hmXntYqzUUPv2uiPvbVBX/Z1uGQtSd
            m4HULsh1PFLcyoPNdpPQV7kCAwEAAQ==
            -----END PUBLIC KEY-----
        EOT -> null
      - rsa_bits                      = 4096 -> null
    }

Plan: 0 to add, 0 to change, 9 to destroy.
azurerm_public_ip.my_vm_public_ip: Destroying... [id=/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/publicIPAddresses/my-vm-public-ip]
azurerm_network_interface_security_group_association.apply_firewall_rules_on_network_card: Destroying... [id=/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/networkInterfaces/my-network-card|/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/networkSecurityGroups/my-vm-firewall]
azurerm_linux_virtual_machine.my_linux_vm: Destroying... [id=/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Compute/virtualMachines/my-linux-vm]
azurerm_public_ip.my_vm_public_ip: Still destroying... [id=/subscriptions/5eaa0abd-72f4-44fa-8395-...work/publicIPAddresses/my-vm-public-ip, 10s elapsed]
azurerm_network_interface_security_group_association.apply_firewall_rules_on_network_card: Still destroying... [id=/subscriptions/5eaa0abd-72f4-44fa-8395-...k/networkSecurityGroups/my-vm-firewall, 10s elapsed]
azurerm_linux_virtual_machine.my_linux_vm: Still destroying... [id=/subscriptions/5eaa0abd-72f4-44fa-8395-...ft.Compute/virtualMachines/my-linux-vm, 10s elapsed]
azurerm_network_interface_security_group_association.apply_firewall_rules_on_network_card: Destruction complete after 12s
azurerm_network_security_group.my_vm_firewall: Destroying... [id=/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/networkSecurityGroups/my-vm-firewall]
azurerm_public_ip.my_vm_public_ip: Destruction complete after 14s
azurerm_linux_virtual_machine.my_linux_vm: Still destroying... [id=/subscriptions/5eaa0abd-72f4-44fa-8395-...ft.Compute/virtualMachines/my-linux-vm, 20s elapsed]
azurerm_linux_virtual_machine.my_linux_vm: Destruction complete after 17m33s
azurerm_network_interface.my_network_card: Destroying... [id=/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/networkInterfaces/my-network-card]
tls_private_key.my_key_pair: Destroying... [id=c1756a3c2af5d7b4809685133371feb85bd8ac73]
tls_private_key.my_key_pair: Destruction complete after 0s
azurerm_network_interface.my_network_card: Destruction complete after 9s
azurerm_subnet.my_subnet: Destroying... [id=/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/virtualNetworks/my-virtual-network/subnets/my-subnet]
azurerm_subnet.my_subnet: Still destroying... [id=/subscriptions/5eaa0abd-72f4-44fa-8395-...s/my-virtual-network/subnets/my-subnet, 10s elapsed]
azurerm_subnet.my_subnet: Destruction complete after 12s
azurerm_virtual_network.my_virtual_network: Destroying... [id=/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/virtualNetworks/my-virtual-network]
azurerm_virtual_network.my_virtual_network: Still destroying... [id=/subscriptions/5eaa0abd-72f4-44fa-8395-...ork/virtualNetworks/my-virtual-network, 10s elapsed]
azurerm_virtual_network.my_virtual_network: Destruction complete after 13s
azurerm_resource_group.tektutor_resource_group: Destroying... [id=/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group]
8395-...resourceGroups/tektutor-resource-group, 1m20s elapsed]
azurerm_resource_group.tektutor_resource_group: Destruction complete after 1m26s

Destroy complete! Resources: 9 destroyed.
</pre>


## Rerun the scripts to see the output variable printed on the screen
```
cd ~/terraform-dec-2022
git pull
cd Day2/create-azure-vm-using-terraform
terraform init
terraform validate
terraform apply --auto-approve
```

Expected output
<pre>
jegan@ubuntu:~/terraform-dec-2022/Day2/create-azure-vm-using-terraform$ terraform apply --auto-approve
tls_private_key.my_key_pair: Refreshing state... [id=040e514c129196298295fc677f63c543f667effd]
azurerm_resource_group.tektutor_resource_group: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group]
azurerm_virtual_network.my_virtual_network: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/virtualNetworks/my-virtual-network]
azurerm_public_ip.my_vm_public_ip: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/publicIPAddresses/my-vm-public-ip]
azurerm_network_security_group.my_vm_firewall: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/networkSecurityGroups/my-vm-firewall]
azurerm_subnet.my_subnet: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/virtualNetworks/my-virtual-network/subnets/my-subnet]
azurerm_network_interface.my_network_card: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/networkInterfaces/my-network-card]
azurerm_network_interface_security_group_association.apply_firewall_rules_on_network_card: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/networkInterfaces/my-network-card|/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group/providers/Microsoft.Network/networkSecurityGroups/my-vm-firewall]
azurerm_linux_virtual_machine.my_linux_vm: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group/providers/Microsoft.Compute/virtualMachines/my-linux-vm]

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last "terraform apply" which may have
affected this plan:

  # azurerm_linux_virtual_machine.my_linux_vm has changed
  ~ resource "azurerm_linux_virtual_machine" "my_linux_vm" {
        id                              = "/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group/providers/Microsoft.Compute/virtualMachines/my-linux-vm"
        name                            = "my-linux-vm"
      + public_ip_address               = "20.172.230.168"
        tags                            = {}
        # (22 unchanged attributes hidden)

        # (3 unchanged blocks hidden)
    }


Unless you have made equivalent changes to your configuration, or ignored the relevant attributes using
ignore_changes, the following plan may include actions to undo or respond to these changes.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Changes to Outputs:
  + private_key       = (sensitive value)
  + public_ip_address = "20.172.230.168"

You can apply this plan to save these new output values to the Terraform state, without changing any real
infrastructure.

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

private_key = <sensitive>
public_ip_address = "20.172.230.168"
</pre>

#### SSH into the Virtual machine we created using Terraform
```
terraform output private_key
terraform output private_key > ./key.pem
chmod 400 ./key.pem
ssh -i ./key.pem azureuser@20.172.230.168
```

## ⛹️‍♀️ Lab - Creating multiple virtual machines using Terraform
```
cd ~/terraform-dec-2022
git pull
cd Day2/create-azure-multiple-vms-using-terraform
terraform init
terraform apply --auto-approve
```
