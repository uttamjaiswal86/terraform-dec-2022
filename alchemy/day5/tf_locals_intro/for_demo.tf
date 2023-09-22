locals {
 n = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
 evens = [for u in local.n: u if u%2 ==0 ]
}

output "flitered" {
value = local.evens

}
