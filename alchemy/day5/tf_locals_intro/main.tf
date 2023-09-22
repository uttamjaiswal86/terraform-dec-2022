resource "azurerm_resource_group" "myrg" {
  for_each = toset(local.a_list)
  name="${random_string.rgprefix.result}rgdemo${local.a_number}-${each.key}"
  location="eastus"
}

resource "random_string" "rgprefix" {
length="9"
special=false
}


locals {
 a_string= "Robochef is an automated robotic ktichen"
 a_number = 15
 a_bollean = true
 b_number = 30
 absum = local.a_number + local.b_number
 add = 300 + 500
 sub = 500 - 100
 multip = 20 * 600
 a_list = ["red", "blue", "orange", "green"]

}


output "localdemo" {
  value = "Sum of ${local.a_number}, ${local.b_number} is ${local.absum}"
}


output "l2" {
  value = local.a_list
}


