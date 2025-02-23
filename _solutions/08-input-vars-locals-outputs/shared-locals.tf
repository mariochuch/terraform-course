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
