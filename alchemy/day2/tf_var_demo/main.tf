resource "azurerm_resource_group" "myrg" {
#name= "${random_string.rgprefix.result}"
name="${random_string.rgprefix.result}rgdemo-${var.rgsuffix}"
#location="westus"
location=var.location
}

resource "random_string" "rgprefix" {
length="9"
special=false
}
