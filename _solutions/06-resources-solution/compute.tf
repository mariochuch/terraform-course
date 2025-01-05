resource "aws_instance" "web" {
  ami = "ami-0a628e1e89aaedf80"
  associate_public_ip_address = true
  instance_type = "t2.micro"
}