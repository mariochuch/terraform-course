locals {
  users_map = {
  for user_info in var.users : user_info.userName => user_info.role... }

  users_map2 = {
    for userName, roles in local.users_map : userName => {
        roles = roles
    }
  }

  user_names_from_map = [ for userName, roles in local.users_map : userName ]
}

output "users_map" {
  value = local.users_map
}

output "users_map2" {
  value = local.users_map2
}

output "user_names_from_map" {
  value = local.user_names_from_map 
  }

output "user_to_output_roles" {
  value = local.users_map2[var.user_to_output].roles
}