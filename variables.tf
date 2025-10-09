
variable "aws_region" {
  description = "AWS region"
  default = "ap-southeast-2"
}

variable "aws_type" {
  description = "AWS ec2 type"
  default = "t3.medium"
}

variable "aws_ami" {
  description = "AWS AMI"
  default = "ami-0c462b53550d4fca8"
}
