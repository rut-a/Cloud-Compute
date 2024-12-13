provider "aws" {
  access_key                  = "test"
  secret_access_key           = "test"
  region                      = "us-east-1"
  endpoints {
    ec2      = "http://localhost:4566"
    rds      = "http://localhost:4566"
    s3       = "http://localhost:4566"
  }
}
