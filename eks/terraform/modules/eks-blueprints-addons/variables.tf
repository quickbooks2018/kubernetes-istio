variable "cluster_name" {
    default = ""
    description = "The name of the cluster"
    type = string
}

variable "cluster_endpoint" {
    default = ""
    description = "The endpoint of the cluster"
    type = string
}

variable "oidc_provider" {
    default = ""
    description = "The OIDC provider of the cluster"
    type = string
}

variable "cluster_version" {
    default = ""
    description = "The version of the cluster"
    type = string
}

variable "node_security_group_id" {
    default = ""
    description = "The security group of the nodes"
    type = string
}

variable "cluster_certificate_authority_data" {
    default = ""
    description = "The certificate authority data of the cluster"
    type = string
}