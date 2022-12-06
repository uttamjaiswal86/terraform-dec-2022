# Day 2

# Configuring terraform to access Azure portal via az command line tool
```
az login --use-device-code
```
The above command will display an URL and a code.  You can launch the URL in your web browser and paste the code displayed in the command line.

Make sure, when you login to azure portal with the azure account credentials you created yesterday for this training.

## Lab - Creating a Resource group in azure using Terraform
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
azurerm_resource_group.tektutor_resource_group: Still destroying... [id=/subscriptions/9eb2e122-36af-4b34-9186-...resourceGroups/tektutor-resource-group, 20s elapsed]
azurerm_resource_group.tektutor_resource_group: Still destroying... [id=/subscriptions/9eb2e122-36af-4b34-9186-...resourceGroups/tektutor-resource-group, 30s elapsed]
azurerm_resource_group.tektutor_resource_group: Still destroying... [id=/subscriptions/9eb2e122-36af-4b34-9186-...resourceGroups/tektutor-resource-group, 40s elapsed]
azurerm_resource_group.tektutor_resource_group: Still destroying... [id=/subscriptions/9eb2e122-36af-4b34-9186-...resourceGroups/tektutor-resource-group, 50s elapsed]
azurerm_resource_group.tektutor_resource_group: Still destroying... [id=/subscriptions/9eb2e122-36af-4b34-9186-...resourceGroups/tektutor-resource-group, 1m0s elapsed]
azurerm_resource_group.tektutor_resource_group: Still destroying... [id=/subscriptions/9eb2e122-36af-4b34-9186-...resourceGroups/tektutor-resource-group, 1m10s elapsed]
azurerm_resource_group.tektutor_resource_group: Still destroying... [id=/subscriptions/9eb2e122-36af-4b34-9186-...resourceGroups/tektutor-resource-group, 1m20s elapsed]
azurerm_resource_group.tektutor_resource_group: Destruction complete after 1m27s

Destroy complete! Resources: 1 destroyed.
</pre>


## Lab - Creating an Azure Virtual machine using Terraform
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
azurerm_linux_virtual_machine.my_linux_vm: Still creating... [20s elapsed]
azurerm_linux_virtual_machine.my_linux_vm: Still creating... [30s elapsed]
azurerm_linux_virtual_machine.my_linux_vm: Still creating... [40s elapsed]
azurerm_linux_virtual_machine.my_linux_vm: Still creating... [50s elapsed]
azurerm_linux_virtual_machine.my_linux_vm: Still creating... [1m0s elapsed]
azurerm_linux_virtual_machine.my_linux_vm: Creation complete after 1m3s [id=/subscriptions/5eaa0abd-72f4-44fa-8395-3f7a030c9d44/resourceGroups/tektutor-resource-group/providers/Microsoft.Compute/virtualMachines/my-linux-vm]

Apply complete! Resources: 9 added, 0 changed, 0 destroyed.
</pre>
