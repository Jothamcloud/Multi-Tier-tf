# Terraform AWS Multi-Tier Web Application

## Table of Contents
1. [Project Overview](#project-overview)
2. [Architecture](#architecture)
3. [Prerequisites](#prerequisites)
4. [Directory Structure](#directory-structure)
5. [Module Description](#module-description)
6. [Getting Started](#getting-started)
7. [Configuration](#configuration)
8. [Deployment](#deployment)
9. [Remote State](#remote-state)
10. [Best Practices](#best-practices)
11. [Maintenance](#maintenance)
12. [Troubleshooting](#troubleshooting)
13. [Contributing](#contributing)

## Project Overview

This Terraform project deploys a multi-tier web application infrastructure on AWS. It includes a VPC, public and private subnets, an Application Load Balancer, EC2 instances in an Auto Scaling Group, an RDS database, and an S3 bucket for static content.

## Architecture

The infrastructure consists of:
- VPC with public and private subnets across two Availability Zones
- Internet Gateway for public internet access
- Application Load Balancer in public subnets
- EC2 instances in private subnets, managed by an Auto Scaling Group
- RDS MySQL database in private subnets
- S3 bucket for static content
- Security Groups for controlling access between components

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (v1.0.0 or newer)
- AWS CLI configured with appropriate credentials
- An AWS account with necessary permissions

## Directory Structure

```
.
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── backend.tf
├── .gitignore
├── .terraformignore
├── README.md
└── modules/
    ├── networking/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── security/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── ec2/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── rds/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── s3/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

## Module Description

- `networking`: Sets up VPC, subnets, and internet gateway
- `security`: Defines security groups for ALB, EC2, and RDS
- `ec2`: Configures ALB, launch template, and Auto Scaling Group
- `rds`: Sets up the RDS MySQL instance
- `s3`: Creates an S3 bucket for static content

## Getting Started

1. Clone this repository
2. Navigate to the project directory
3. Run `terraform init` to initialize the Terraform working directory

## Configuration

1. Create a `terraform.tfvars` file in the root directory
2. Specify values for the variables defined in `variables.tf`. For example:

```hcl
aws_region        = "us-west-2"
vpc_cidr          = "10.0.0.0/16"
instance_type     = "t2.micro"
ami_id            = "ami-0c55b159cbfafe1f0"
db_instance_class = "db.t2.micro"
db_name           = "myapp"
db_username       = "admin"
db_password       = "your-secure-password"
bucket_name       = "your-unique-bucket-name"
```

## Deployment

1. Run `terraform plan -out=tfplan` to preview the changes
2. If the plan looks good, apply it with `terraform apply tfplan`
3. Terraform will output the ALB DNS name, RDS endpoint, and S3 bucket name upon successful application

## Remote State

It's recommended to use remote state storage. To set this up:

1. Create an S3 bucket for state storage
2. Configure the backend in `backend.tf`:

```hcl
terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "path/to/your/state/file.tfstate"
    region         = "us-west-2"
  }
}
```

4. Run `terraform init` to initialize the backend

## Best Practices

- Use consistent naming conventions for resources
- Implement a tagging strategy for better resource management
- Regularly update Terraform and provider versions
- Use workspaces for managing multiple environments
- Encrypt sensitive data in transit and at rest

## Maintenance

- Regularly apply `terraform plan` to check for drift
- Keep your Terraform modules and root configuration up to date
- Regularly review and optimize your infrastructure for cost and performance
- Implement monitoring and alerting for your infrastructure

## Troubleshooting

- If you encounter issues, check the Terraform and AWS provider logs
- Ensure your AWS credentials are correctly configured
- Verify that all required variables are set in `terraform.tfvars`
- Check AWS service health dashboard for any ongoing issues

## Contributing

1. Fork the repository
2. Create a new branch for your feature
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

