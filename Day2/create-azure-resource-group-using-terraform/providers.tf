terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.34.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "11223344-8899-1234-abcd-1234abcadf343" #Replace this with your subscription_id before init/approve/destroy
}
