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

