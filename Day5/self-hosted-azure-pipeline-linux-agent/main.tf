terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.33.0"
    }
    azuredevops = {
      source = "microsoft/azuredevops"
      version = "0.3.0"
    }
  }
}

provider "azurerm" {
    features {}
}

provider "azuredevops" {}

variable "your_devops_organization_name" {
  type = string
}

variable "your_devops_organization_personal_access_token" {
  type = string
}

variable "your_linux_agent_pool_name" {
  type = string
  default = "TekTutor_Linux_Agent_Pool"
}

variable "your_resource_group_name" {
  type = string
  default = "tektutor-resource-group"
}

variable "your_preferred_azure_location" {
  type = string
  default = "eastus" 
}

resource "azuredevops_agent_pool" "self_hosted_azure_pipeline_linux_pool" {
  name           = var.your_linux_agent_pool_name
  auto_provision = true 
}

module "aci-devops-agent" {
  source                  = "Azure/aci-devops-agent/azurerm"
  version                 = "0.9.3"
  resource_group_name     = "tektutor-resource-group"
  location                = "eastus"
  enable_vnet_integration = false
  create_resource_group   = true

  linux_agents_configuration = {
    agent_name_prefix = "linux-agent"
    agent_pool_name   = var.your_linux_agent_pool_name 
    count             = 2,
    docker_image      = "tektutor/azure-pipeline-linux-agent"
    docker_tag        = "latest"
    cpu               = 1
    memory            = 4
    user_assigned_identity_ids   = []
    use_system_assigned_identity = false
  }
  azure_devops_org_name              = var.your_devops_organization_name 
  azure_devops_personal_access_token = var.your_devops_organization_personal_access_token 
}

resource "azuredevops_project" "project" {
  name       = "azure-pipeline-maven-pipeline"
  description        = "TekTutor Azure Maven Pipeline Demo" 
  depends_on = [
    azuredevops_agent_pool.self_hosted_azure_pipeline_linux_pool
  ]
}

resource "azuredevops_git_repository" "github_repo" {
  project_id = azuredevops_project.project.id
  name       = "TekTutor Terraform Azure Pipeline Repository"
  default_branch = "refs/heads/main"

  initialization {
    init_type   = "Import"
    source_type = "Git"
    source_url  = "https://github.com/tektutor/spring-ms.git"
  }
}
