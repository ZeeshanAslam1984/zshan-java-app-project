terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Using region-correct Amazon Linux 2023 x86_64 AMI
locals {
  amazon_linux_ami = "ami-052064a798f08f0d3"
}

module "nexus_instance" {
  source        = "./ec2_instance"
  ami           = local.amazon_linux_ami
  instance_type = var.aws_type
  instance_name = "nexus-server"
}

module "sonar_instance" {
  source        = "./ec2_instance"
  ami           = local.amazon_linux_ami
  instance_type = var.aws_type
  instance_name = "sonar-server"
}

module "test_instance" {
  source        = "./ec2_instance"
  ami           = local.amazon_linux_ami
  instance_type = var.aws_type
  instance_name = "test-server"
}
