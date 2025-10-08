variable "aws_region" {
  description = "AWS region"
  default = "ap-southeast-2"
}

variable "aws_type" {
  description = "AWS ec2 type"
  default = "t2.micro"
}

variable "aws_ami" {
  description = "AWS AMI"
  default = "ami-03c4f11b50838ab5d"
}
