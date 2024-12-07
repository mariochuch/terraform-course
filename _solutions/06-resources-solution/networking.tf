resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name      = "06-resources-solution-main"
    ManagedBy = "Terraform"
    Project   = "06-resources-solution"
  }
}
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name      = "06-resources-solution-main"
    ManagedBy = "Terraform"
    Project   = "06-resources-solution"
  }
}



