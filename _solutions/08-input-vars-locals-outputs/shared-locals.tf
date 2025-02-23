locals {
  project       = "08-input-vars-locals-outputs"
  project_owner = "terraform-course"
  cost_centre   = 1234
  managed_by    = "Terraform"
}

locals {
  common_tags = {
    project       = local.project
    project_owner = local.project_owner
    cost_centre   = local.cost_centre
    managed_by    = local.managed_by
  }
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