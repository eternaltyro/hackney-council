# EC2 instance
resource "aws_instance" "default" {
  instance_type = var.instance_type
  ami           = var.ami

  root_block_device {
    volume_size = var.root_volume_size
    device_name = "/dev/xvda"
  }

  ebs_block_device {
    volume_size = var.ebs_volume_size
    device_name = "/dev/sdf"
  }

  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.default.id]
}

resource "aws_security_group" "default" {

  # No IPv6 for now
  ingress {
    description = "Allow inbound to HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Assuming just one IP
  ingress {
    description = "Allow SSH from DMZ"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.20.1.1/32"]
  }

  egress {
    description = "Allow outbound everywhere"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}


output "instance_id" {
  value = aws_instance.default.id
}

output "instance_private_ip" {
  value = aws_instance.default.private_ip
}






















