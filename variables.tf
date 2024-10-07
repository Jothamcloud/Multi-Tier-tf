variable "aws_region" {
  description = "The AWS region to deploy to"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "instance_type" {
  description = "The instance type for EC2 instances"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The AMI ID for EC2 instances"
  default     = "ami-0e86e20dae9224db8"  
}

variable "db_instance_class" {
  description = "The instance class for the RDS instance"
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "The name of the database"
  default     = "myapp"
}

variable "db_username" {
  description = "The username for the database"
}

variable "db_password" {
  description = "The password for the database"
}

variable "bucket_name" {
  description = "The name of the S3 bucket for static content"
}