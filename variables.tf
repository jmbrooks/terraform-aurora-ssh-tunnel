# Mandatory variables
variable "bastion_key_pair_public_key" {
  description = "The public key for the AWS key pair you will use to connect to the bastion host"
}

variable "cluster_password" {
  description = "Password for the cluster instance login"
}

# Optional variables
variable "bastion_key_name" {
  description = "The name of the AWS key pair you will use to connect to the bastion host"
  default     = "ec2-tunnel-sample"
}

variable "cluster_name" {
  description = "The name of the Aurora MySQL database cluster"
  default     = "cluster-sample"
}

variable "cluster_instance_class" {
  description = "The EC2 instance type for the database, defaults to R4 large"
  default     = "db.r4.large"
}

variable "cluster_is_publicly_accessible" {
  description = "Whether or not the cluster will be set as publicly accessible, defaults to false"
  default     = false
}

variable "cluster_username" {
  description = "Username for the cluster instance login"
  default     = "admin"
}