output "vpc_id" {
  description = "The AWS ID from the created VPC"
  value       = module.vpc.vpc_id

}

output "module_public_subnets" {
  description = "The ID and the avilability zone of the public subnets"
  value       = module.vpc.public_subnets
}

output "module_private_subnets" {
  description = "The ID and the avilability zone of the private subnets"
  value       = module.vpc.private_subnets
}