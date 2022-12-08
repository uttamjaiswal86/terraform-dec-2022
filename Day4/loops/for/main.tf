variable "contacts" {
   type = map

   default = {
     "Ram"    = "123-456-7890"
     "Robert" = "575-674-1234"
     "Abdul"  = "674-881-5234"
   }
}

output "map_values" {
  value = {
    for k,v in var.contacts : k => v
  }
}
