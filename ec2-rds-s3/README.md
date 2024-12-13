# Automated Infrastructure with Terraform

This project demonstrates the deployment of a simple cloud infrastructure using **Terraform** and **LocalStack** for local testing. 
It provisions an EC2 instance, an RDS MySQL database, and an S3 bucket. 

## Features

- Provision an EC2 instance to host an application.
- Deploy an RDS MySQL database for storage needs.
- Create an S3 bucket for file storage.
- Use Infrastructure as Code (IaC) practices for consistent and repeatable deployments.

##Disclaimer
RDS is only available in the localstack pro version. You can use dynamodb instead for the free version of localstack.


## Prerequisites
- [Terraform](https://www.terraform.io/downloads) (v1.4.0 or later)
- [LocalStack](https://docs.localstack.cloud/get-started/) (for local testing)
- [AWS CLI](https://aws.amazon.com/cli/) (optional, for managing AWS resources)

## Project Setup

### Clone the Repository
```bash
git clone <https://github.com/rut-a/Cloud-Compute.git>
cd terraform-project/ec2-rds-s3
```

### Configure Terraform
#### LocalStack Configuration
The project is configured to use LocalStack by default. To enable it:
1. Ensure LocalStack is running:
   ```bash
   localstack start
   ```
2. Verify LocalStack CLI installation:
   ```bash
   awslocal --version
   ```

#### AWS Configuration
To deploy to AWS instead:
1. Update the `provider` block in `main.tf`:
   ```hcl
   provider "aws" {
     access_key    = "<YOUR_AWS_ACCESS_KEY>"
     secret_access_key = "<YOUR_AWS_SECRET_KEY>"
     region        = "us-east-1"
   }
   ```
2. Remove any LocalStack-specific endpoints from the provider.
3. Set up an S3 backend for state management (optional).

### Initialize Terraform
```bash
terraform init
```

### Plan and Apply
1. To preview changes:
   ```bash
   terraform plan
   ```
2. To deploy resources:
   ```bash
   terraform apply
   ```
3. Confirm when prompted.

## Verifying the Deployment
- **EC2 Instance**: Check the instance is running locally (LocalStack) or in AWS.
- **RDS Database**: Test database connectivity using credentials provided in the `terraform.tfvars` file.
- **S3 Bucket**: Verify the bucket exists and allows uploads using `awslocal` or AWS CLI.

### LocalStack Commands
- List S3 buckets:
  ```bash
  awslocal s3 ls
  ```
- Describe EC2 instances:
  ```bash
  awslocal ec2 describe-instances
  ```

### AWS CLI Commands
- List S3 buckets:
  ```bash
  aws s3 ls
  ```
- Describe EC2 instances:
  ```bash
  aws ec2 describe-instances
  ```

## Directory Structure
```
.
├── main.tf            # Terraform configuration file
├── outputs.tf         # Output values for resources
├── terraform.tfvars   # Variable values (do not commit sensitive data!)
├── README.md          # Project documentation
└── .gitignore         # Files to ignore in version control
```

## Clean Up
To destroy all resources:
```bash
terraform destroy
```
For LocalStack, stop the local environment:
```bash
localstack stop
```

## Enhancements
- Integrate with AWS Systems Manager Parameter Store for secure storage of sensitive information.
- Implement monitoring using AWS CloudWatch.
- Add support for additional AWS regions.

