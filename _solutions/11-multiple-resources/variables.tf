variable "subnet_count" {
  description = "Number of subnets to create"
  type        = number
  default     = 2

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
  }))

  default = []
}