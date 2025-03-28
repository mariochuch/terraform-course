resource "aws_instance" "from_count" {
  count         = var.ec2_instance_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.main[
    count.index % length(aws_subnet.main)
  ].id
  tags = {
    Name    = "${local.project}-${count.index}"
    Project = local.project
  }
}

resource "aws_instance" "from_list" {
  count         = length(var.ec2_instance_config_list)
  ami           = local.ami_ids[var.ec2_instance_config_list[count.index].ami]
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main[0].id
  tags = {
    Name    = "${local.project}-${count.index}"
    Project = local.project
  }
}



