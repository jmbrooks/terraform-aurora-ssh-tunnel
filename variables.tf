variable "vpc_id" {
  description = "Existing VPC to use (specify this, if you don't want to create new VPC)"
  default     = ""
}

variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overriden"
  default     = "0.0.0.0/0"
}

variable "cluster_name" {
  default = "multi-site-sample"
}

variable "instance_class" {
  default = "db.r4.large"
}

variable "username" {
  default = "admin"
}

variable "password" {
  default = "tGXNNZ2sVzGdU[jDoDpLVtLp"
}