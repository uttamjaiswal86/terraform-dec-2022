terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.33.0"
    }

    tls = {
      source = "hashicorp/tls"
      version = "4.0.4"
    }
  }
/**/
  backend "azurerm" {
     resource_group_name = "tektutor-resource-group-new"
     storage_account_name = "tektutortfstate" 
     container_name = "tektutortfstate"
     key = "terraform.tfstate"
  }
/**/
}

provider "azurerm" {
  features {}

  #Replace this subscription_id with your Azure pass subscription id
  subscription_id = "9eb2e122-36af-4b34-9186-2cc8053669e3" 
}
