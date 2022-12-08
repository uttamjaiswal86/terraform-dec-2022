variable "contacts" {
   type = map(string)

   default = {
     "Ram"    = "123-456-7890"
     "Robert" = "575-674-1234"
     "Abdul"  = "674-881-5234"
   }
}

variable "names" {
  type = list(string)

  default = [ "virtualmachine","resourcegroup","networkcard" ] 
}

output "map_values" {
  value = {
    for k,v in var.contacts : k => v
  }
}

output "list_values" {
  value = {
    for v in var.names : v =>  v
  }
}

resource "local_file" "file" {
  for_each = toset(var.names)
  filename = each.key
  content = each.value
}
