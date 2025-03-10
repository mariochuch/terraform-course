locals {
  double_numbers = [for num in var.numbers_list : num * 2]
  even_numbers   = [for num in var.numbers_list : num if num % 2 == 0]
  firstNames     = [for person in var.object_list : person.firstName]
  fullNames = [
    for person in var.object_list : "${person.firstName} ${person.lastName}"
  ]
}

output "double_numbers" {
  value = local.double_numbers
}

output "even_numbers" {
  value = local.even_numbers
}

output "firstNames" {
  value = local.firstNames
}

output "fullNames" {
  value = local.fullNames
}
