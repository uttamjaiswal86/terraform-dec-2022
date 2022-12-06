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
jegan@ubuntu:~/terraform-dec-2022/Day2/create-azure-resource-group-using-terraform$ terraform destroy --auto-approve
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
