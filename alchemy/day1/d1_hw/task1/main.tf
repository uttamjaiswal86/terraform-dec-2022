resource "random_integer" "f1_num" {
  min=1000
  max=9999
}

resource "random_string" "f1_str" {
length="12"
special=false
}

resource "local_file" "f1" {
filename="/tmp/${random_integer.f1_num.result}"
content=random_string.f1_str.result
}

resource "local_file" "f2" {
#filename="/tmp/uttamkumar-${random_integer.f1_num}.txt"
filename="/tmp/uttamkumar-${random_integer.f1_num.result}.txt"
content=random_string.f1_str.result
}

resource "local_file" "f3" {
count="10"
filename="/tmp/randomfiles_${count.index}"
content="${random_string.f1_str.result}"
}

output "f1_filename" {
value=local_file.f1.filename
}

output "f2_filename" {
value=local_file.f2.filename
}

/*
output "f3_file_name" {
value="${local_file.f3.filename}"
}
*/

