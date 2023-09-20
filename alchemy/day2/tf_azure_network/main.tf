resource "azurerm_resource_group" "myterraformgroup" {
  name="${random_string.rgprefix.result}rgdemo-${var.rgsuffix}"
  location=var.location
}

resource "random_string" "rgprefix" {
length="9"
special=false
}
