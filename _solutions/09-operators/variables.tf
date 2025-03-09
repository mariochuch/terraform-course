variable "numbers_list" {
  type = list(number)
}

variable "object_list" {
  type = list(object({
    firstName = string
    lastName  = string
  }))
}