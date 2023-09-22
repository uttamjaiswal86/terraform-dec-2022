locals {
ts = timestamp()
current_month = formatdate("MMM", local.ts)
today = formatdate("DD", local.ts)
tomorrow = formatdate("DD", timeadd(local.ts, "24h")) 
}

locals {
 lcase = "${lower("A mixed case String")}"
 ucase = "${upper("uttam kumar")}"
 trimmed = "${trimspace("    A String with leading and trailing space    ")}"
}
output "datetime" {
value = "${local.ts} and current month is ${local.current_month}, today ${local.today}"
}

output "string_function" {
value = "${local.lcase}, ${local.ucase}, ${local.trimmed}"
}
