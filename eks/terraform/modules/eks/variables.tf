variable "cluster_name" {
  description = "The name of the cluster"
  default     = "1.23"
  type        = string
}

variable "cluster_version" {
  description = "The version of the cluster"
  default     = ""
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID"
  default     = ""
  type        = string
}

variable "vpc_owner_id" {
  description = "The VPC owner ID"
  default     = ""
  type        = string
}

variable "subnet_ids" {
  description = "The subnet IDs"
  default     = []
  type        = list(string)
}

variable "tags" {
  description = "The tags"
  default     = {}
  type        = map(string)
}
