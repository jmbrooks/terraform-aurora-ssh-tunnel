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

variable "password" {
  description = "Password for the cluster instance login"
}