resource "aws_security_group" "instance_sg" {
  name        = "${var.instance_name}-sg"
  description = "Allow access for ${var.instance_name}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = "zesh-dnd"
  vpc_security_group_ids = [aws_security_group.instance_sg.id]

  tags = {
    Name = var.instance_name
  }
}
