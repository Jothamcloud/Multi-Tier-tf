terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "networking" {
  source   = "./modules/networking"
  vpc_cidr = var.vpc_cidr
}

module "security" {
  source = "./modules/security"
  vpc_id = module.networking.vpc_id
}

module "ec2" {
  source                = "./modules/ec2"
  vpc_id                = module.networking.vpc_id
  private_subnet_ids    = module.networking.private_subnet_ids
  public_subnet_ids     = module.networking.public_subnet_ids
  alb_security_group_id = module.security.alb_security_group_id
  web_security_group_id = module.security.web_security_group_id
  instance_type         = var.instance_type
  ami_id                = var.ami_id
}

module "rds" {
  source               = "./modules/rds"
  vpc_id               = module.networking.vpc_id
  private_subnet_ids   = module.networking.private_subnet_ids
  db_security_group_id = module.security.db_security_group_id
  db_instance_class    = var.db_instance_class
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}