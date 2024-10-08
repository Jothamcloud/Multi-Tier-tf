# Collaborative GitOps Terraform AWS Multi-Tier Web Application

## Table of Contents
1. [Project Overview](#project-overview)
2. [Architecture](#architecture)
3. [Prerequisites](#prerequisites)
4. [Repository Structure](#repository-structure)
5. [Setup and Configuration](#setup-and-configuration)
6. [Usage](#usage)
7. [Collaborative Workflow](#collaborative-workflow)
8. [GitOps Workflows](#gitops-workflows)
9. [Security Considerations](#security-considerations)
10. [Troubleshooting](#troubleshooting)
11. [Contributing](#contributing)
12. [License](#license)

## Project Overview

This GitOps project uses Terraform to deploy and manage a scalable, multi-tier web application infrastructure on AWS. It follows GitOps principles, where the Git repository is the single source of truth for declarative infrastructure and application code. The project is designed for collaborative team environments, allowing multiple engineers to propose, review, and implement infrastructure changes in a controlled and transparent manner.

## Architecture

- VPC with public and private subnets across multiple Availability Zones
- Internet Gateway for public internet access
- Application Load Balancer in public subnets
- EC2 instances in private subnets, managed by an Auto Scaling Group
- RDS MySQL database in private subnets
- S3 bucket for static content
- Security Groups for controlling access between components

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (v1.9.4 or newer)
- AWS CLI configured with appropriate credentials
- GitHub account (for GitOps workflows)

## Repository Structure

```
.
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars (git-ignored)
├── .gitignore
├── README.md
├── modules/
│   ├── networking/
│   ├── security/
│   ├── ec2/
│   ├── rds/
│   └── s3/
└── .github/
    └── workflows/
        ├── terraform-validate.yml
        ├── terraform-plan.yml
        ├── terraform-apply.yml
        └── terraform-destroy.yml
```

## Setup and Configuration

1. Clone this repository
2. Create a `terraform.tfvars` file in the root directory with your specific variable values
3. Set up GitHub Secrets for sensitive information:
   - AWS_ACCESS_KEY_ID
   - AWS_SECRET_ACCESS_KEY
   - TF_VAR_db_username
   - TF_VAR_db_password
   - TF_VAR_bucket_name
4. Set up GitHub Variables for non-sensitive configuration:
   - TF_VAR_aws_region
   - TF_VAR_vpc_cidr
   - TF_VAR_instance_type
   - TF_VAR_ami_id
   - TF_VAR_db_instance_class
   - TF_VAR_db_name

## Usage

This project follows GitOps principles and is designed for team collaboration. All changes to the infrastructure go through a structured process of proposal, review, and controlled deployment:

1. Engineers make changes to the Terraform files in their local repository
2. Changes are committed and pushed to a feature branch
3. A Pull Request (PR) is opened to the `main` branch
4. The CI/CD pipelines automatically validate and plan the changes
5. Team members review the proposed changes and the Terraform plan
6. Discussions and adjustments can be made directly in the PR
7. Once approved by the team, the PR can be merged
8. Upon merging, changes are automatically applied to the production infrastructure

This process ensures that:
- All changes are thoroughly reviewed before implementation
- The team has visibility into all infrastructure modifications
- There's a clear audit trail of changes and approvals
- Production deployments are controlled and predictable

## Collaborative Workflow

1. **Propose Changes**: 
   - Create a new branch for your proposed changes
   - Make modifications to the Terraform configurations
   - Commit and push your changes

2. **Open Pull Request**:
   - Create a PR to merge your changes into the `main` branch
   - The Terraform Plan workflow will automatically run and comment on the PR

3. **Review Process**:
   - Team members review the code changes
   - Reviewers examine the Terraform plan output
   - Discussions and requests for changes can be made in the PR comments

4. **Iterate if Necessary**:
   - Address any feedback or concerns
   - Push additional commits to update the PR
   - The plan will automatically re-run, showing the updated changes

5. **Approval**:
   - Once the team is satisfied, approvals can be given on the PR
   - Required approvals (as set in repository settings) must be met

6. **Merge and Deploy**:
   - Merge the approved PR into the `main` branch
   - This automatically triggers the Terraform Apply workflow
   - Changes are deployed to the production infrastructure

7. **Verify**:
   - The team can verify the changes in the production environment
   - Any issues can be quickly addressed through the same process

This collaborative workflow ensures that all changes are thoroughly reviewed, tested, and approved before reaching the production environment, maintaining infrastructure integrity and team alignment.

## GitOps Workflows

### 1. Terraform Validate (`terraform-validate.yml`)
- **Trigger**: On every push to any branch
- **Purpose**: Checks the syntax and validity of Terraform files
- **Actions**: Runs `terraform init` and `terraform validate`
- **Team Usage**: Provides immediate feedback on syntax issues

### 2. Terraform Plan (`terraform-plan.yml`)
- **Trigger**: On pull requests to the `main` branch
- **Purpose**: Shows the planned changes to the infrastructure
- **Actions**: Runs `terraform plan` and comments the plan output on the PR
- **Team Usage**: Allows reviewers to see exactly what changes are being proposed

### 3. Terraform Apply (`terraform-apply.yml`)
- **Trigger**: On push to the `main` branch (i.e., when a PR is merged)
- **Purpose**: Applies the changes to the production infrastructure
- **Actions**: Runs `terraform apply -auto-approve`
- **Team Usage**: Automatically deploys approved changes to production

### 4. Terraform Destroy (`terraform-destroy.yml`)
- **Trigger**: Manual trigger from GitHub Actions tab
- **Purpose**: Destroys the entire infrastructure (use with extreme caution!)
- **Actions**: Requires manual confirmation, then runs `terraform destroy -auto-approve`
- **Team Usage**: Provides a controlled way to tear down the infrastructure if needed

## Security Considerations

- Sensitive data is stored in GitHub Secrets
- S3 bucket is configured with appropriate access controls
- RDS instance is in a private subnet
- All resources are protected by security groups
- Changes to infrastructure require PR approval, enhancing security through code review
- The principle of least privilege is applied to AWS IAM roles and policies

## Troubleshooting

- Check the GitHub Actions tab for detailed logs of each workflow run
- Review the comments on PRs for Terraform plan outputs
- Ensure all required GitHub Secrets and Variables are set correctly
- Verify that your AWS credentials have the necessary permissions
- For persistent issues, consult the AWS CloudWatch logs for specific resource problems

## Contributing

1. Fork the repository
2. Create a new branch for your feature or fix
3. Make your changes and commit them with clear, descriptive messages
4. Push to your fork and submit a Pull Request to the main repository
5. Wait for the validation and plan workflows to complete
6. Address any issues or concerns raised in the PR review
7. Once approved, your changes will be merged and deployed


Use the link below to checkout the full project workthrough/documentation 