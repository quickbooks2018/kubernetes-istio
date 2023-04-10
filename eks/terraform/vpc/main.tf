# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest

provider "aws" {
  region = "us-east-1"
}


module "vpc" {
  source = "../modules/vpc"

  cluster_name = "cloudgeeks-eks-dev"

}