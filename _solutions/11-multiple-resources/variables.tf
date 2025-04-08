variable "subnet_config" {
  type        = map(object({
    cidr_block = string
  }))

  validation {
    condition = alltrue([
      for config in values(var.subnet_config) : can(cidrnetmask(config.cidr_block))
    ])
    error_message = "At least one CIDR block is not valid."
  }
}

variable "ec2_instance_count" {
  type        = number
  default     = 1
  description = "value of ec2 instance count"
}

variable "ec2_instance_config_list" {
  type = list(object({
    instance_type = string
    ami           = string
    subnet_name   = optional(string, "default")
  }))

  default = []

  validation {
    condition = alltrue([
      for config in var.ec2_instance_config_list : contains(["t2.micro"], config.instance_type)
    ])
    error_message = "Only t2.micro instances are allowed."
  }

  validation {
    condition = alltrue([
      for config in var.ec2_instance_config_list :
      contains(["ubuntu", "nginx"], config.ami)
    ])

    error_message = "At least one of the provided \"ami\" values is not supported.\nSupported \"ami\" values: \"ubuntu\", \"nginx\"."
  }
}

variable "ec2_instance_config_map" {
  type = map(object({
    instance_type = string
    ami           = string
    subnet_name   = optional(string, "default")
  }))

  default = {}

  validation {
    condition = alltrue([
      for config in values(var.ec2_instance_config_map) : contains(["t2.micro"], config.instance_type)
    ])
    error_message = "Only t2.micro instances are allowed."
  }

  validation {
    condition = alltrue([
      for config in values(var.ec2_instance_config_map) :
      contains(["ubuntu", "nginx"], config.ami)
    ])

    error_message = "At least one of the provided \"ami\" values is not supported.\nSupported \"ami\" values: \"ubuntu\", \"nginx\"."
  }

}
