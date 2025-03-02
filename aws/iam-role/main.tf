locals {
  iam_role_name = "${var.service_name}-${var.description}-iam-role"
}

resource "aws_iam_role" "this" {
  name = local.iam_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json

  tags = merge(
    {
      Name        = local.iam_role_name
      Environment = var.environment
      Project     = var.project_name
      Owner       = var.owner
    },
    var.additional_tags
  )
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts.AssumeRole"]

    principals {
      type = "Service"
      identifiers = var.assume_role_principals
    }
  }
}