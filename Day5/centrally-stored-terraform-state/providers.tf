terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.33.0"
    }
  }
  backend "azurerm" {
     resource_group_name = "centralized-state-rg"
     storage_account_name = "jegantfstate" 
     container_name = "jegantfstate"
     key = "tektutor"
     #Replace this subscription_id with your Azure pass subscription id
     subscription_id = "9eb2e122-36af-4b34-9186-2cc8053669e3" 
  }
}

provider "azurerm" {
  features {}

  #Replace this subscription_id with your Azure pass subscription id
  subscription_id = "9eb2e122-36af-4b34-9186-2cc8053669e3" 
}
