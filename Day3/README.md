# Day 3

## ⛹️‍♂️ Lab - Creating a LoadBalance and adding the Virtual Machines as load balancer backend using Terraform
```
cd ~/terraform-dec-2022
git pull
cd Day3/loadbalancer

terraform init
terraform apply --auto-approve
```

Expected output
<pre>
jegan@ubuntu:~/terraform-dec-2022/Day3/loadbalancer$ <b>terraform apply --auto-approve</b>
var.vm_count
  Enter a value: 4

tls_private_key.my_key_pair: Refreshing state... [id=6be9ea38fde1946be30ab4f955fad0db2ebb56b6]
local_file.private_key_file: Refreshing state... [id=a9471202ecd87caaeecaa651fa663509b0bfd1b8]
null_resource.change_private_key_file_permission: Refreshing state... [id=4009265864602550990]
azurerm_resource_group.tektutor_resource_group: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2]
azurerm_public_ip.lb_public_ip: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/publicIPAddresses/PublicIPForLB]
azurerm_public_ip.my_vm_public_ip[1]: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/publicIPAddresses/my-vm-public-ip-1]
azurerm_public_ip.my_vm_public_ip[2]: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/publicIPAddresses/my-vm-public-ip-2]
azurerm_public_ip.my_vm_public_ip[3]: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/publicIPAddresses/my-vm-public-ip-3]
azurerm_virtual_network.my_virtual_network: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/virtualNetworks/my-virtual-network]
azurerm_public_ip.my_vm_public_ip[0]: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/publicIPAddresses/my-vm-public-ip-0]
azurerm_network_security_group.my_vm_firewall[0]: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/networkSecurityGroups/my-vm-firewall-0]
azurerm_network_security_group.my_vm_firewall[1]: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/networkSecurityGroups/my-vm-firewall-1]
azurerm_network_security_group.my_vm_firewall[2]: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/networkSecurityGroups/my-vm-firewall-2]
azurerm_network_security_group.my_vm_firewall[3]: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/networkSecurityGroups/my-vm-firewall-3]
azurerm_subnet.my_subnet: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/virtualNetworks/my-virtual-network/subnets/my-subnet]
azurerm_network_interface.my_network_card[3]: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/networkInterfaces/my-network-card-3]
azurerm_lb.my_loadbalancer: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/loadBalancers/my-load-balancer]
azurerm_network_interface.my_network_card[2]: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/networkInterfaces/my-network-card-2]
azurerm_network_interface.my_network_card[0]: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/networkInterfaces/my-network-card-0]
azurerm_network_interface.my_network_card[1]: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/networkInterfaces/my-network-card-1]
azurerm_network_interface_security_group_association.apply_firewall_rules_on_network_card[2]: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/networkInterfaces/my-network-card-2|/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/networkSecurityGroups/my-vm-firewall-2]
azurerm_network_interface_security_group_association.apply_firewall_rules_on_network_card[3]: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/networkInterfaces/my-network-card-3|/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/networkSecurityGroups/my-vm-firewall-3]
azurerm_network_interface_security_group_association.apply_firewall_rules_on_network_card[1]: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/networkInterfaces/my-network-card-1|/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/networkSecurityGroups/my-vm-firewall-1]
azurerm_network_interface_security_group_association.apply_firewall_rules_on_network_card[0]: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/networkInterfaces/my-network-card-0|/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/networkSecurityGroups/my-vm-firewall-0]
azurerm_linux_virtual_machine.my_linux_vm[3]: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Compute/virtualMachines/my-linux-vm-3]
azurerm_linux_virtual_machine.my_linux_vm[2]: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Compute/virtualMachines/my-linux-vm-2]
azurerm_linux_virtual_machine.my_linux_vm[0]: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Compute/virtualMachines/my-linux-vm-0]
azurerm_linux_virtual_machine.my_linux_vm[1]: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Compute/virtualMachines/my-linux-vm-1]
azurerm_lb_backend_address_pool.lb_backend: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/loadBalancers/my-load-balancer/backendAddressPools/LBBackendAddressPool]
azurerm_lb_rule.rule_for_forwarding_lb_port_80_traffic_to_backend_vms: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/loadBalancers/my-load-balancer/loadBalancingRules/LBRule]
time_sleep.wait_120_seconds: Refreshing state... [id=2022-12-07T04:59:29Z]
azurerm_lb_backend_address_pool_address.vms[1]: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/loadBalancers/my-load-balancer/backendAddressPools/LBBackendAddressPool/addresses/add-vm-1-to-lb-pool]
azurerm_lb_backend_address_pool_address.vms[0]: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/loadBalancers/my-load-balancer/backendAddressPools/LBBackendAddressPool/addresses/add-vm-0-to-lb-pool]
azurerm_lb_backend_address_pool_address.vms[2]: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/loadBalancers/my-load-balancer/backendAddressPools/LBBackendAddressPool/addresses/add-vm-2-to-lb-pool]
null_resource.install_nginx_web_server_on_azure_vms[1]: Refreshing state... [id=3564913806900666715]
null_resource.install_nginx_web_server_on_azure_vms[0]: Refreshing state... [id=704917517918503858]
null_resource.install_nginx_web_server_on_azure_vms[3]: Refreshing state... [id=976159449919619021]
null_resource.install_nginx_web_server_on_azure_vms[2]: Refreshing state... [id=3557420501242467080]
azurerm_lb_backend_address_pool_address.vms[3]: Refreshing state... [id=/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/loadBalancers/my-load-balancer/backendAddressPools/LBBackendAddressPool/addresses/add-vm-3-to-lb-pool]

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last "terraform apply" which may have
affected this plan:

  # azurerm_public_ip.lb_public_ip has changed
  ~ resource "azurerm_public_ip" "lb_public_ip" {
        id                      = "/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/publicIPAddresses/PublicIPForLB"
      + ip_tags                 = {}
        name                    = "PublicIPForLB"
      + tags                    = {}
      + zones                   = []
        # (9 unchanged attributes hidden)
    }


Unless you have made equivalent changes to your configuration, or ignored the relevant attributes using
ignore_changes, the following plan may include actions to undo or respond to these changes.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Changes to Outputs:
  + lb_public_ip = {
      + allocation_method       = "Static"
      + ddos_protection_mode    = "VirtualNetworkInherited"
      + ddos_protection_plan_id = null
      + domain_name_label       = null
      + edge_zone               = ""
      + fqdn                    = null
      + id                      = "/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/publicIPAddresses/PublicIPForLB"
      + idle_timeout_in_minutes = 4
      + ip_address              = "52.249.196.66"
      + ip_tags                 = {}
      + ip_version              = "IPv4"
      + location                = "eastus"
      + name                    = "PublicIPForLB"
      + public_ip_prefix_id     = null
      + resource_group_name     = "tektutor-resource-group-2"
      + reverse_fqdn            = null
      + sku                     = "Standard"
      + sku_tier                = "Regional"
      + tags                    = {}
      + timeouts                = null
      + zones                   = []
    }

You can apply this plan to save these new output values to the Terraform state, without changing any real
infrastructure.

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

lb_public_ip = {
  "allocation_method" = "Static"
  "ddos_protection_mode" = "VirtualNetworkInherited"
  "ddos_protection_plan_id" = tostring(null)
  "domain_name_label" = tostring(null)
  "edge_zone" = ""
  "fqdn" = tostring(null)
  "id" = "/subscriptions/9eb2e122-36af-4b34-9186-2cc8053669e3/resourceGroups/tektutor-resource-group-2/providers/Microsoft.Network/publicIPAddresses/PublicIPForLB"
  "idle_timeout_in_minutes" = 4
  "ip_address" = "52.249.196.66"
  "ip_tags" = tomap({})
  "ip_version" = "IPv4"
  "location" = "eastus"
  "name" = "PublicIPForLB"
  "public_ip_prefix_id" = tostring(null)
  "resource_group_name" = "tektutor-resource-group-2"
  "reverse_fqdn" = tostring(null)
  "sku" = "Standard"
  "sku_tier" = "Regional"
  "tags" = tomap({})
  "timeouts" = null /* object */
  "zones" = toset([])
}
private_key = <sensitive>
public_ip_address = [
  "172.174.58.231",
  "20.169.246.111",
  "20.232.137.46",
  "20.25.42.245",
]
ssh_command = "ssh -i ./key.pem azureuser@vm-public-ip"
ssh_user_name = "azureuser"
</pre>

#### Testing the load balancer
```
curl load-balancer-public-ip
```

## ⛹️‍♀️ Lab - Creating an Azure Kubernetes Cluster managed service using Terraform
```
cd ~/terraform-dec-2022
git pull
cd Day3/provision-aks-cluster

terraform init
terraform apply --auto-approve
```

### Installing kubectl client tool on your RPS lab machine
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin
kubectl version
```

### Creating a config file
```
terraform output kube_config > config
mkdir -p ~/.kube
mv config /home/rps/.kube
kubectl get nodes
```
You need to remove the EOT at the begining and end of the config file and save it.

#### Once your AKS cluster is ready, you can try the below 
```
kubectl get nodes
kubectl create deploy nginx --image=bitnami/nginx:latest --replicas=3
kubectl expose deploy/nginx --port=8080 --type=LoadBalancer
kubectl get svc
kubectl describe svc/nginx
kubectl get deploy,rs,pods
```

Access the service using the external ip displayed in the nginx loadbalancer service.


#### Dispose the cluster once you are done with the exercise
```
cd ~/terraform-dec-2022
git pull
cd Day3/provision-aks-cluster
terraform destroy --auto-approve
```

## ⛹️‍♂️ Lab - Creating a Windows virtual machine in Azure portal using Terraform
```
cd ~/terraform-dec-2022
git pull
cd Day3/create-windows-azure-virtual-machine

terraform init
terraform apply --auto-approve
```

## ⛹️‍♂️ Lab - Creating a Linux Virtual Machine Scale sets
This will create bunch of virtual machines and put in behind a load balancer.  Virtual machine scale sets allows us to setup either manual/automatic virtual machine scale up/down on demand.

```
cd ~/terraform-dec-2022
git pull
cd Day3/virtual-machine-scale-sets

terraform init
terraform apply --auto-approve
```

## ⛹️‍♂️ Lab - Creating a Cosmos DB Managed service using Terraform
Cosmos DB is a azure managed service.  Cosmos DB stores and retrieves Document based data. In this lab exercise, we have automated the cosmodb managed service using Terraform.

For example, MongoDB nosql database stores records(officially documents) as JSON objects.  Even the query is written in javascript like syntax.  MongoDB doesn't support SQL(Structured Query Langauage like RDBMS supports ).

```
cd ~/terraform-dec-2022
git pull
cd Day3/cosmos-db

terraform init
terraform apply --auto-approve
```

## Ansible
- Configuration Management Tool from a company called Ansible Inc
- Michael Deehan is the founder of Ansible Inc
- Michael Deehan was a former employee of Red Hat
- Ansible comes in flavours
  1. Ansible Core 
     - opensource
     - supports only command line interface
     - no support from Red Hat [ only community support - stackoverflow :) ]
     - well documented tool
  2. Red Hat Ansible Tower 
    - is developed on top opensource Ansible Core
    - supports Web Console (GUI)
 - Ansible is developed in Python
 - Ansible Doman Specific Language (DSL - YAML)
 - Playbooks are written in YAML
 - Ansible comes with many built-in modules
 - Ansible Modules are
   - Python scripts to automate configuration management in Unix/Linux/Mac
   - Powershell scripts to automate configuration management in Windows
 - Ansible Controller Machine (ACM)
   - this is the machine where Ansible is installed and playbooks are executed
   - only a Unix/Linux/Mac machine can act as an ACM
 - Ansible Nodes
   - these are server where software installation and configuration you wanted to automate
   - can be Unix, Linux, Mac, Windows, Cisco Routers, Switches, etc.,
   - Unix/Mac/Linux
     - Software requirements
       1. Python
       2. SSH Server
   - Windows 
     - Software requirements
       1. Powershell
       2. WinRM
- Ansible Inventory
  - text file
  - it has SSH/RDP connection details to the Ansible Nodes
  - there are two types
    1. static inventory ( text file, almost looks like widows INI file )
    2. dynamic inventory ( this can be python script )


## Installing Ansible in Ubuntu
```
sudo apt install -y ansible
ansible --version
```

Expected output
<pre>
jegan@tektutor:~/terraform-dec-2022/Day3$ <b>ansible --version</b>
ansible 2.9.6
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/home/jegan/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.8.10 (default, Jun 22 2022, 20:18:18) [GCC 9.4.0]
</pre>

## Lab - Understanding ansible static inventry and ansible ad-hoc command
We will provision 3 virtual machine and use them as our Ansible nodes.

Head over to Day2 below folder and provision 3 virtual machines
```
cd ~/terraform-dec-2022
git pull
cd Day2/create-azure-multiple-vms-using-terraform

terraform init
terraform apply --auto-approve
```

Copy the pem file to Day3 ansible folder
```
cp ~/terraform-dec-2022/Day2/create-azure-multiple-vms-using-terraform/key.pem  ~/terraform-dec-2022/Day3/ansible
```

