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

output "prod_vpc_id" {
  value = data.aws_vpc.prod_vpc.id
}

output "current_user" {
  value = data.aws_caller_identity.current
}

output "current_region" {
  value = data.aws_region.current
}

output "ubuntu_name" {
  value = data.aws_ami.ubuntu.id
}

resource "aws_instance" "web" {
  # ami id ingx               = "ami-0b3f0c8da2149d7c6"
  # ami id Ubuntu             = "ami-0a628e1e89aaedf80"
  ami                         = data.aws_ami.ubuntu.id
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }

}