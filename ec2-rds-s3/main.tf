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


resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"  # Replace with an appropriate LocalStack-compatible AMI.
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-LocalStack-EC2"
  }
}


resource "aws_db_instance" "database" {
  identifier          = "terraform-db"
  engine              = "mysql"
  instance_class      = "db.t2.micro"
  allocated_storage   = 20
  username            = "admin"
  password            = "password"
  skip_final_snapshot = true

  tags = {
    Name = "Terraform-LocalStack-RDS"
  }
}


resource "aws_s3_bucket" "bucket" {
  bucket = "terraform-localstack-bucket"

  tags = {
    Name = "Terraform-LocalStack-S3"
  }
}
