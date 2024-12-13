provider "aws" {
  endpoints {
    ec2      = "http://localhost:4566"
    rds      = "http://localhost:4566"
    s3       = "http://localhost:4566"
  }
}


resource "aws_instance" "web" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
}

resource "aws_db_instance" "app_db" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  db_name              = "mydatabase" # Updated
  username             = "admin"
  password             = "admin123"
  parameter_group_name = "default.mysql8.0"
}

resource "aws_s3_bucket" "app_bucket" {
  bucket = "my-app-bucket"
}

resource "aws_s3_bucket_acl" "app_bucket_acl" {
  bucket = aws_s3_bucket.app_bucket.id
  acl    = "private"
}
