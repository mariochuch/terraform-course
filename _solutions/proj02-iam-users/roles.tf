locals {
  role_policies = {
    readonly = [
      "ReadOnlyAccess"
    ]
    developer = [
      "AmazonVPCFullAccess",
      "AmazonEC2FullAccess",
      "AmazonRDSFullAccess"
    ]
    admin = [
      "AdministratorAccess"
    ]
    auditor = [
      "SecurityAudit"
    ]
  }
}

data "aws_iam_policy_document" "assumed_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::195977627017:user/mario"]
    }
  }
}

resource "aws_iam_role" "roles" {
  for_each           = toset(keys(local.role_policies))
  name               = each.key
  assume_role_policy = data.aws_iam_policy_document.assumed_role_policy.json
}