resource "aws_s3_bucket_policy" "this" {
  bucket = var.bucket_name
  policy = data.aws_iam_policy_document.bucket_policy.json
}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    actions   = var.actions
    resources = ["${var.bucket_arn}/*"]

    principals {
      type        = "AWS"
      identifiers = var.principals
    }
  }
}
