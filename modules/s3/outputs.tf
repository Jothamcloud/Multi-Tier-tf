output "s3_bucket_name" {
  description = "The name of the S3 bucket for static content"
  value       = aws_s3_bucket.static.id
}