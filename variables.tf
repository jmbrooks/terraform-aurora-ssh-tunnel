variable "cluster_name" {
  default = "cluster-sample"
}

variable "instance_class" {
  description = "The EC2 instance type for the database, defaults to R4 large"
  default     = "db.r4.large"
}

variable "username" {
  description = "Username for the cluster instance login"
  default     = "admin"
}

variable "bastion_key_name" {
  description = "The name of the AWS key pair you will use to connect to the bastion host"
  default     = "ec2-tunnel-sample"
}

variable "bastion_key_pair_public_key" {
  description = "The public key for the AWS key pair you will use to connect to the bastion host"
}

variable "password" {
  description = "Password for the cluster instance login"
}