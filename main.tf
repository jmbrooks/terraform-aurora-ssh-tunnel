provider "aws" {
  region = "us-east-2"
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count                        = 2
  identifier                   = "${var.cluster_name}-instance-${count.index}"
  cluster_identifier           = aws_rds_cluster.cluster.id
  instance_class               = var.instance_class
  engine                       = "aurora"
  publicly_accessible          = true
  apply_immediately            = true
  performance_insights_enabled = false
}

resource "aws_rds_cluster" "cluster" {
  cluster_identifier              = var.cluster_name
  database_name                   = "multi_site"
  master_username                 = var.username
  master_password                 = var.password
  availability_zones              = ["us-east-2a", "us-east-2b", "us-east-2c"]
  vpc_security_group_ids          = [aws_security_group.aurora-sg.id]
  skip_final_snapshot             = true
  deletion_protection             = false
  engine                          = "aurora"
  engine_version                  = ""
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.aurora-row-binlogs.name
}

resource "aws_rds_cluster_parameter_group" "aurora-row-binlogs" {
  family      = "aurora5.6"
  name        = "aurora-row-binlogs-pg"
  description = "RDS row-based binary logging cluster parameter group"
  parameter {
    name  = "binlog_format"
    value = "ROW"
  }
}

resource "aws_security_group" "aurora-sg" {
  name   = "aurora-security-group"
  vpc_id = aws_default_vpc.default.id

  ingress {
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