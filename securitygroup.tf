resource "aws_security_group" "chefdk-instance" {
  vpc_id      = aws_vpc.chef.id
  name        = "allow-ssh"
  description = "security group that allows ssh and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.SSH_ALLOW
  }
  tags = {
    Name = "chefdk-instance"
  }
}
