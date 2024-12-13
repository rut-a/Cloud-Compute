# EC2 Instance Public IP
output "ec2_public_ip" {
  value       = aws_instance.web.public_ip
  description = "The public IP address of the EC2 instance."
}

# RDS Database Endpoint
output "rds_endpoint" {
  value       = aws_db_instance.app_db.endpoint
  description = "The endpoint of the RDS database instance."
}

# S3 Bucket Name
output "s3_bucket_name" {
  value       = aws_s3_bucket.app_bucket.bucket
  description = "The name of the S3 bucket."
}

