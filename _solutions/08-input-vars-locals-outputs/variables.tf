variable "ec2_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The type of managed EC2 instance"
  validation {
    condition     = contains(["t2.micro", "t3.micro", "t3.large"], var.ec2_instance_type)
    error_message = "Only supports t2.micro or t3.micro"
  }
}

variable "ec2_volume_config" {
  type = object({
    size = number
    type = string
  })
  description = "The size and the type of root block volume for EC2 instances"
  default = {
    size = 10
    type = "gp3"
  }
}

variable "additional_tags" {
  type    = map(string)
  default = {}
}

variable "my_sensitive_vale" {
  type = string
  sensitive = true
}
