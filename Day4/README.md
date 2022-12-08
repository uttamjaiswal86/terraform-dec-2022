# Day 4

## What is Terraform Modules?
- reusable code
- every directory is considered as a module in Terraform
- there are two types of modules
  1. Root module
  - this has providers
  - this is the one we normally init and apply
  2. Child module
  - this will not be executed directly
  - mostly will not have its own providers
  - has reusable code that can be invoked from other modules including root module
 - equivalent to Dynamic Link Library(DLL)
   - Just like dll can't be executed directly which is always used by some application.
   - via the application we can invoke the reusable functions from DLL
- Best Practices
  - it is preferred to refactor the terraform scripts into many small meaningful files
  - Examples
    - providers.tf - this file will have all the provider plugins that are required for the root module to work
    - variables.tf - this file will have all the input variables with or without default values
    - outputs.tf - this file wiil have all the output variables that are printed on the terminal screen once the provisioning is complete
    - main.tf - this has the main automation code

## ⛹️‍♀️ Lab - Understanding Terraform child modules
```
cd ~/terraform-dec-2022
git pull

cd Day4/root-module/
terraform init
terraform apply --auto-approve
```

### ⛹️‍♀️ Lab - Passing value to variables to terraform from command line
In the below command, root_module_vm_count is a variable declared in the Terraform root module that we wrote.  
```
terraform apply --auto-approve -var root_module_vm_count=3
```

##  ⛹️‍♀️ Lab - Using for_each terraform loop
```
cd ~/terraform-dec-2022
git pull

cd Day4/for-each/
terraform init
terraform apply --auto-approve
```

##  ⛹️‍♀️ Lab - Using for terraform loop
```
cd ~/terraform-dec-2022
git pull

cd Day4/for/
terraform init
terraform apply --auto-approve
```

##  ⛹️‍♀️ Lab - Variable value validation
```
cd ~/terraform-dec-2022
git pull

cd Day4/variable-validation
terraform init
terraform apply --auto-approve
```

## What is Azure App Service?
- enables you to build and host web apps, mobile backends and RESTful APIs in the programming language of your choice without managing infrastructure
- it offers auto-scaling, high-availability
- supports Linux and Windows hosting
- enables automated deployments from GitHub, Azure DevOps or any Git based repository
- supports CI/CD
- Three ways the App Service ( Web applications ) can be deployed into the Azure Service Plan
  1. Souce code from GitHub, version controls
  2. Docker Containers
  3. Static web pages deployed onto the Virtual Machine that comes with Service Plan

## What is Azure Service Plan?
- This is the infrastructure i.e Virtual Machine with Linux/Windows where your App Service ( web application) can be deployed
- A single Service plan can allow multiple App Service deployments
- Here you can choose the machine configuration
  - How many CPU cores you want?
  - RAM
  - Disk size etc.,

## Assignment 1 - Create an App Service using Docker container

Try to deploy an Azure App Service manually with docker container
tektutor/hello-ms:3.0

## Assignment 2 - Create an App Service using GitHub Repository source code using GitHub Actions

Try to deploy an Azure App Service manually

Language Stack - Java 11

From GitHub repo https://github.com/tektutor/spring-ms.git
You need to fork the above GitHub into your GitHub account, as App Service requires GitHub authorization. Once you have forked the above repo, use your spring-ms GitHub repo to deploy the App Service.

Once you are done with this exercise, please confirm via WebEx chat.

Please feel free to share your screen if you need any help.
