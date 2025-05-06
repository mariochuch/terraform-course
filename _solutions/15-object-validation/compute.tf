locals {
  allowed_instance_types = ["t2.micro", "t3.micro"]
}
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Owner is Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_vpc" "prod_vpc" {
  tags = {
    Env = "Prod"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

# data "aws_iam_policy_document" "static_website" {
#   statement {
#     sid = "PublicReadGetObject"
#     principals {
#       type        = "*"
#       identifiers = ["*"]
#     }

#     actions = ["s3:GetObject"]

#     resources = ["${aws_s3_bucket.public_read_bucket.arn}/*"]
#   }
# }

resource "aws_instance" "this" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }

  lifecycle {
    precondition {
        condition     = contains(local.allowed_instance_types, var.instance_type)
        error_message = "Invalied instance type. Only t2.micro is allowed."
    }
  }

}