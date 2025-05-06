locals {
  iam_policy_name = "${var.service_name}-${var.description}-iam-policy"
}

resource "aws_iam_policy" "this" {
  name   = local.iam_policy_name
  path   = var.policy_path
  policy = data.aws_iam_policy_document.policy.json

  tags = merge(
    {
      Name        = local.iam_policy_name
      Environment = var.environment
      Project     = var.project_name
      Owner       = var.owner
    },
    var.additional_tags
  )
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = var.role_name
  policy_arn = aws_iam_policy.this.arn
}

data "aws_iam_policy_document" "policy" {
  statement {
    actions   = var.actions
    resources = var.resources
  }
}