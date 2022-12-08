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
