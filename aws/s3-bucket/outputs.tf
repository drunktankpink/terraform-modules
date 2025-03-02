output s3_bucket_name {
  description = "The name of the S3 bucket."
  value       = aws_s3_bucket.this.id
}
output s3_bucket_id {
  description = "The name of the bucket."
  value       = aws_s3_bucket.this.id
}

output s3_bucket_arn {
  description = "The ARN of the bucket. (arn:aws:s3:::bucketname)."
  value       = aws_s3_bucket.this.arn
}

output s3_bucket_domain_name {
  description = "The domain name of the S3 bucket (bucketname.s3.amazonaws.com)."
  value       = aws_s3_bucket.this.bucket_domain_name
}

output s3_bucket_regional_domain_name {
  description = "The region-specific domain name of the S3 bucket (bucketname.s3.region.amazonaws.com)."
  value       = aws_s3_bucket.this.bucket_regional_domain_name
}

output s3_bucket_region {
  description = "The AWS region where the S3 bucket is hosted."
  value       = aws_s3_bucket.this.region
}