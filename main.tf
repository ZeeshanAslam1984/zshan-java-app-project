terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region  # Change to your desired region
}

# Fetch latest Amazon Linux 2023 AMI for your region
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2023-ami-kernel-6.1-hvm-*-x86_64*"]
  }
}

module "nexus_instance" {
  source        = "./ec2_instance"
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.aws_type
  instance_name = "nexus-server"
}

module "sonar_instance" {
  source        = "./ec2_instance"
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.aws_type
  instance_name = "sonar-server"
}

module "test_instance" {
  source        = "./ec2_instance"
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.aws_type
  instance_name = "test-server"
}
