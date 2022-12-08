terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.34.0"
    }
    local = {
      source = "hashicorp/local"
      version = "2.2.3"
    }
  }
}

provider "azurerm" {
  features {}

  #Replace this subscription_id with your Azure pass subscription id
  subscription_id = "9eb2e122-36af-4b34-9186-2cc8053669e3" 
}

provider "local" { }
