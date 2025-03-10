variable "numbers_list" {
  type = list(number)
}

variable "object_list" {
  type = list(object({
    firstName = string
    lastName  = string
  }))
}

variable "numbers_map" {
  type = map(number)
}

variable "users" {
  type = list(object({
    userName = string
    role     = string
  }))
}

variable "user_to_output" {
  type = string
}