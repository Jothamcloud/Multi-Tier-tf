variable "vpc_id" {
  description = "The ID of the VPC"
}

variable "private_subnet_ids" {
  description = "The IDs of the private subnets"
  type        = list(string)
}

variable "db_security_group_id" {
  description = "The ID of the database security group"
}

variable "db_instance_class" {
  description = "The instance class for the RDS instance"
}

variable "db_name" {
  description = "The name of the database"
}

variable "db_username" {
  description = "The username for the database"
}

variable "db_password" {
  description = "The password for the database"
}
