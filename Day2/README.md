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
