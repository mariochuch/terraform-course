locals {
  firstNamesFromSplat = var.object_list[*].firstName
  roles_from_splat = [for username, roles_costam in local.users_map2 : roles_costam.roles ]
  roles_from_splat2 =  values(local.users_map2)[*].roles
}

output "firstNamesFromSplat" {
  value = local.firstNamesFromSplat
}

output "roles_from_splat" {
  value = local.roles_from_splat
}

output "roles_from_splat2" {
  value = local.roles_from_splat2
}