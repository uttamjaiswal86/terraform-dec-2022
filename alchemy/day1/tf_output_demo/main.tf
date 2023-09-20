resource "random_string" "mydata" {
    length="9"
    special = false
}

output "endmsg" {
  value=random_string.mydata.result
}

output "d2" {
  value= "Random string with Length: ${random_string.mydata.length} and Value:${random_string.mydata.result}"
}

