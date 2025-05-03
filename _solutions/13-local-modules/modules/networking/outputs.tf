# 1. VPC ID
# 2. Public subnets - subnet_key => { subnet_id, availability_zone }
# 3. Private subnets - subnet_key => { subnet_id, availability_zone }

locals {
  output_public_subnets = {
    for key in keys(local.public_subnets) : key => {
      subnet_id         = aws_subnet.this[key].id
      availability_zone = aws_subnet.this[key].availability_zone
    }
  }

  output_private_subnets = {
    for key in keys(local.private_subnets) : key => {
      subnet_id         = aws_subnet.this[key].id
      availability_zone = aws_subnet.this[key].availability_zone
    }
  }

}

output "vpc_id" {
  description = "The AWS ID from the created VPC"
  value       = aws_vpc.this.id
}

output "public_subnets" {
  value = local.public_subnets
}

output "private_subnets" {
  value = local.private_subnets
}