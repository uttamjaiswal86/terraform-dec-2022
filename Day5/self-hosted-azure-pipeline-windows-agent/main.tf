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

provider "azuredevops" {}

provider "azurerm" {
    features {}
}

variable "your_devops_organization_name" {
  type = string
}

variable "your_devops_organization_personal_access_token" {
  type = string
}

variable "your_windows_agent_pool_name" {
  type = string
  default = "TekTutor_Windows_Agent_Pool"
}

variable "your_resource_group_name" {
  type = string
  default = "tektutor-resource-group"
}

variable "your_preferred_azure_location" {
  type = string
  default = "eastus" 
}

resource "azuredevops_agent_pool" "self_hosted_azure_pipeline_windows_pool" {
  name           = var.your_windows_agent_pool_name
  auto_provision = false 
}

module "aci-devops-agent" {
  source                  = "Azure/aci-devops-agent/azurerm"
  version                 = "0.9.3"
  resource_group_name     = var.your_resource_group_name 
  location                = "eastus"
  enable_vnet_integration = false
  create_resource_group   = false 

  windows_agents_configuration = {
    agent_name_prefix = "windows-agent"
    agent_pool_name   = azuredevops_agent_pool.self_hosted_azure_pipeline_windows_pool.name
    count             = 2,
    docker_image      = "jcorioland/aci-devops-agent"
    docker_tag        = "0.2-win"
    cpu               = 1
    memory            = 4
  }

  azure_devops_org_name              = var.your_devops_organization_name 
  azure_devops_personal_access_token = var.your_devops_organization_personal_access_token 
}

resource "azuredevops_project" "project" {
  name       = "azure-windows-pipeline-1"
  description        = "TekTutor Azure Pipeline Demo" 
  depends_on = [
    azuredevops_agent_pool.self_hosted_azure_pipeline_windows_pool
  ]
}

resource "azuredevops_git_repository" "github_repo" {
  project_id = azuredevops_project.project.id
  name       = "TekTutor Terraform Azure Pipeline Repository"
  default_branch = "refs/heads/main"

  initialization {
    init_type   = "Import"
    source_type = "Git"
    source_url  = "https://github.com/tektutor/terraform-azure-pipelines.git"
  }
}
