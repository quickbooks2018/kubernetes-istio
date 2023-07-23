
# Eks Blueprints Addons Module
# https://github.com/aws-ia/terraform-aws-eks-blueprints/tree/main/modules/kubernetes-addons
# Example https://github.com/aws-ia/terraform-aws-eks-blueprints/blob/main/examples/karpenter/main.tf
# https://github.com/aws-ia/terraform-aws-eks-blueprints?ref=v4.25.0# Sub Module
module "kubernetes_addons" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints//modules/kubernetes-addons?ref=v4.32.1"

  eks_cluster_id               = var.cluster_name
  eks_cluster_endpoint         = var.cluster_endpoint
  eks_oidc_provider            = var.oidc_provider
  eks_cluster_version          = var.cluster_version
  eks_worker_security_group_id = var.node_security_group_id



  enable_aws_load_balancer_controller  = true
  enable_metrics_server                = true
  enable_cluster_autoscaler            = false
  enable_amazon_eks_aws_ebs_csi_driver = false

  enable_karpenter = true
  karpenter_helm_config = {
    name       = "karpenter"
    chart      = "karpenter"
    repository = "oci://public.ecr.aws/karpenter"
    version    = "v0.29.0"
    namespace  = "karpenter"
  }
}

# kubernetes provider
provider "kubernetes" {
  host                   = var.cluster_endpoint
  cluster_ca_certificate = base64decode(var.cluster_certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
  }
}

# Helm Provider
provider "helm" {
  kubernetes {
    host                   = var.cluster_endpoint
    cluster_ca_certificate = base64decode(var.cluster_certificate_authority_data)

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
    }
  }

}
