variable "ec2_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The type of managed EC2 instance"
  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.ec2_instance_type)
    error_message = "Only supports t2.micro or t3.micro"
  }
}

variable "ec2_volume_type" {
  type        = string
  description = "Volume type between gp2 and gp3"
}

variable "ec2_volume_size" {
  type        = number
  description = "The size in GB of root block volume attached to managed EC2 instances"
}