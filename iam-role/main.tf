data "aws_caller_identity" "current" {}

locals {
  iam_policy_name = "${var.service_name}-${var.description}-iam-policy"
  iam_role_name = "${var.service_name}-${var.description}-iam-role"
}

resource "aws_iam_policy" "this" {
  name = local.iam_policy_name
  path = var.policy_path
  policy = var.iam_policy

  tags = {
    Name = local.iam_policy_name
  }
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts.AssumeRole"]

    principals {
      type = "Service"
      identifiers = ["${var.aws_service}.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "this" {
  name = local.iam_role_name
  force_detatch_policy = data.aws_iam_policy_document.assume_role_policy.json

  tags = {
    Name = local.iam_role_name
  }
}

resource "aws_iam_policy_attachment" "this" {
  role = aws_iam_role.this.id
  policy_arn = aws_iam_policy.this.arn
}