output "r1" {
value=random_string.data10.result
}

output "r2" {
value=random_password.password.result
sensitive=true
}
