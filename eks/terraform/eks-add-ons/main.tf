provider "aws" {
  region = "us-east-1"
}



# Define the terraform_remote_state data source
data "terraform_remote_state" "eks_s3_remote_state" {
  backend = "s3"

  config = {
    bucket = "cloudgeeksca-terraform"
    key    = "env/dev/cloudgeeks-dev-eks.tfstate"
    region = "us-east-1"
  }
}


# Eks Blueprints Addons Module
# https://github.com/aws-ia/terraform-aws-eks-blueprints/tree/main/modules/kubernetes-addons
# Example https://github.com/aws-ia/terraform-aws-eks-blueprints/blob/main/examples/karpenter/main.tf
# https://github.com/aws-ia/terraform-aws-eks-blueprints?ref=v4.25.0

# Sub Module
module "kubernetes_addons" {
  source = "../modules/eks-blueprints-addons"

  cluster_name                       = data.terraform_remote_state.eks_s3_remote_state.outputs.eks.eks.cluster_name
  cluster_endpoint                   = data.terraform_remote_state.eks_s3_remote_state.outputs.eks.eks.cluster_endpoint
  oidc_provider                      = data.terraform_remote_state.eks_s3_remote_state.outputs.eks.eks.oidc_provider
  cluster_version                    = data.terraform_remote_state.eks_s3_remote_state.outputs.eks.eks.cluster_version
  node_security_group_id             = data.terraform_remote_state.eks_s3_remote_state.outputs.eks.eks.node_security_group_id
  cluster_certificate_authority_data = data.terraform_remote_state.eks_s3_remote_state.outputs.eks.eks.cluster_certificate_authority_data
}