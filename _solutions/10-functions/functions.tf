locals {
  name = "Mario Wario"
  age  = 15
  my_object = {
    key1 = 10
    key2 = "my_value"
  }
}

output "users" {
  value = startswith(lower(local.name), "mario")
}

output "example_with_power" {
  value = pow(local.age, 2)
}

output "users_from_yml" {
  value = yamldecode(file("${path.module / users.yaml}")).users[*].name
}

output "convert_json" {
  value = jsonencode(local.my_object)
}