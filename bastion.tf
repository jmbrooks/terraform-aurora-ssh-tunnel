resource "aws_default_vpc" "default" {}

resource "aws_instance" "bastion" {
  ami           = "ami-0e01ce4ee18447327"
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
  key_name   = var.bastion_key_name
  public_key = var.bastion_key_pair_public_key
}