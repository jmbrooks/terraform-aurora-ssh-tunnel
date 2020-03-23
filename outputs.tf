output "bastion_public_dns" {
  value = aws_instance.bastion.public_dns
}

output "aurora_cluster_endpoint" {
  value = aws_rds_cluster.cluster.endpoint
}