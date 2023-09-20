resource "random_string" "data10" {
length = "14"
}

resource "random_password" "password" {
  length=12
  special=true
}
