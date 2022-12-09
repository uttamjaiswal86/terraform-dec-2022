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
- Azure App Service is integrated with other Azure services including Azure Container Apps or Azure Functions
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

## What is Azure Container Apps ?
- enables you to build serverless microservices based on containers
- optimized for running general purpose containers, especially for applications that span many microservices deployed in containers
- powered by Kubernetes and open-source technologies like Dapr, KEDA, and envoy.
- Supports Kubernetes-style apps and microservices with features like service discovery and traffic splitting.
- enables event-driven application architectures by supporting scale based on traffic and pulling from event sources like queues, including scale to zero.
- support of long running processes and can run background tasks.

### Points to note
- Azure Container Apps doesn't provide direct access to the underlying Kubernetes APIs
- if you require access to the Kubernetes APIs and control plane, you should use Azure Kubernetes Service. 
- if you would like to build Kubernetes-style applications and don't require direct access to all the native Kubernetes APIs and cluster management, Container Apps provides a fully managed experience based on best-practices. 

## What is Azure Container Instances ?
- Azure Container Instances (ACI) provides a single pod of Hyper-V isolated containers on demand. 
- lower-level "building block" option compared to Container Apps. 
- Concepts like scale, load balancing, and certificates are not provided with ACI containers. 
- For example, to scale to five container instances, you create five distinct container instances. 
- Azure Container Apps provide many application-specific concepts on top of containers, including certificates, revisions, scale, and environments. 
- Users often interact with Azure Container Instances through other services. 
- For example, Azure Kubernetes Service can layer orchestration and scale on top of ACI through virtual nodes. 
- If you need a less "opinionated" building block that doesn't align with the scenarios Azure Container Apps is optimizing for, Azure Container Instances is an ideal option.

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

##  ⛹️‍♀️ Lab - Deploying your first Azure AppService using Terraform using Docker Image from Docker Hub
```
cd ~/terraform-dec-2022/
git pull
cd Day4/AppService/docker-basic
terraform init
terraform apply --auto-approve
```

##  ⛹️‍♀️ Lab - Deploying a multi-container Azure AppService using Terraform using Docker Compose file
```
cd ~/terraform-dec-2022/
git pull
cd Day4/AppService/docker-compose
terraform init
terraform apply --auto-approve
```
