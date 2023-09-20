resource "azurerm_resource_group" "myrg" {
name= "${random_string.rgprefix.result}rgdemo"
location="westus"
}

resource "random_string" "rgprefix" {
length=9
special=false
}
