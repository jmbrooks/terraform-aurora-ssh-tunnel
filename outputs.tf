output "aurora_cluster_endpoint" {
  value = aws_rds_cluster.cluster.endpoint
}

output "aurora_username" {
  value = aws_rds_cluster.cluster.master_username
}

output "aurora_password" {
  sensitive = true
  value     = aws_rds_cluster.cluster.master_password
}

output "bastion_public_dns" {
  value = aws_instance.bastion.public_dns
}

output "bastion_key_pair_name" {
  value = aws_key_pair.bastion_key.key_name
}