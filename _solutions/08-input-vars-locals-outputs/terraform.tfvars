ec2_instance_type = "t2.micro"

ec2_volume_config = {
  size = 20
  type = "gp2"
}

additional_tags = {
  "ValuesFrom" = "terraform.tfvars"
  my_sensitive_vale = "This is my sensitive tag"
}

