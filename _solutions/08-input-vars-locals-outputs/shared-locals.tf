locals {
  project       = "08-input-vars-locals-outputs"
  project_owner = "terraform-course"
  cost_centre   = 1234
  managed_by    = "Terraform"
  name          = "Storage Chatka Puchatka"
  source        = "Created by terraform project 08-input-vars-locals-outputs"
}

locals {
  common_tags = {
    project       = local.project
    project_owner = local.project_owner
    cost_centre   = local.cost_centre
    managed_by    = local.managed_by
    name          = local.name
    source        = local.name
  }
}

locals {
  multiple_2x2             = 2 * 2
  logic_comparison_euqlity = 2 != 2
  logic_comparison         = 2 < 1
  logical_true_or_false    = true || false
  logical_true_and_false   = true && false
}

output "s3_project_bucket_name" {
  value = aws_s3_bucket.project_bucket.bucket
  description = "The name of the S3 bucket"
}

output "instance_arn" {
  value = aws_instance.compute.arn
  description = "Tags added to volume"
}

output "s3_bucket_tags" {
  value = aws_s3_bucket.project_bucket.tags_all
  description = "List of tags added to s3 bucket"
}

output "sensitive_var" {
  sensitive = true
  value = var.my_sensitive_value
}

output "operators" {
  value = {
    multiple_2x2             = local.multiple_2x2
    logic_comparison_euqlity = local.logic_comparison_euqlity
    logic_comparison         = local.logic_comparison
    logical_true_or_false    = local.logical_true_or_false
    logical_true_and_false   = local.logical_true_and_false 
  }
  
}