variable "vpc_id" {
  description = "The ID of the VPC"
}

variable "private_subnet_ids" {
  description = "The IDs of the private subnets"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "The IDs of the public subnets"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "The ID of the ALB security group"
}

variable "web_security_group_id" {
  description = "The ID of the web security group"
}

variable "instance_type" {
  description = "The instance type for EC2 instances"
}

variable "ami_id" {
  description = "The AMI ID for EC2 instances"
}
