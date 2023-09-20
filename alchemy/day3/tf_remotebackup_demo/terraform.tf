terraform {
  backend "azurerm" {
    resource_group_name  = "rgstorage0c6sw"
    storage_account_name = "mystorageyjbq5f"
    container_name       = "myscontainer2023yjbq5f"
    key                  = "terraform.tfstate"
  }
}
