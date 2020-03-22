resource "aws_default_vpc" "default" {}

resource "aws_instance" "bastion" {
  ami           = "ami-1d4e7a66"
  key_name      = aws_key_pair.bastion_key.key_name
  instance_type = "t2.micro"
  security_groups = [
  aws_security_group.bastion-sg.name]
  associate_public_ip_address = true
}

resource "aws_security_group" "bastion-sg" {
  name   = "bastion-security-group"
  vpc_id = aws_default_vpc.default.id

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "tcp"
    from_port   = 3306
    to_port     = 3306
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "bastion_key" {
  key_name   = "tf-ec2-app"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3Xmnd8M5UUQKkYCU4EaB56RwdldGI3mNdMnewJZtfNqJrkNCO7olBypvGrg2A+etyt0qp+3Fp0Qd7CylaCpS7oMv6dYIgV/K8/sYdwZ03uR7JNWyjcl1mm+z1eQIoM7fAiPfBOEXqc3vK4pR/eqwHVSqvMZy+f7V9FfL9GhsMZW1XBEl9QH0n1fJ2EIwTdliOX81NFgMrTKDDdxH6Owxuyw6/ukCaC8qrpZHQIFq3W5VHGwT9nA5RjKoEfd+MzyoQc5+aD8O5DDvEuMA/Og2mN5kDY1tk5MnTTMl9GeMfUnfLYByHId1Pm8AFCCw26ihoSKwYeswy23+SolqGZrFz johnathanbrooks@Johnathans-MacBook-Pro.local"
}