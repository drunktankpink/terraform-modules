resource "aws_iam_role" "cross_account" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        AWS = "arn:aws:iam::${var.trusted_account_id}:role/${var.oidc_role_name}"
      },
      Action = "sts:AssumeRole"
    }]
  })

  tags = {
    Purpose = "Cross-account role for Terraform GitHub provisioning"
  }
}

resource "aws_iam_role_policy_attachment" "admin_access" {
  role       = aws_iam_role.cross_account.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}