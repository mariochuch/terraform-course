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

resource "aws_instance" "compute" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ec2_instance_type
  tags = merge(var.additional_tags, {
    ManagedBy = "Terraform"
    Source    = "Created by terraform project 08-input-vars-locals-outputs"
    Name      = "Compute Chatka Puchatka"
  })

  root_block_device {
    delete_on_termination = true
    volume_size           = var.ec2_volume_config.size
    volume_type           = var.ec2_volume_config.type
    tags = {
      name   = "Storage Chatka Puchatka"
      source = "Created by terraform project 08-input-vars-locals-outputs"
    }

  }
}

