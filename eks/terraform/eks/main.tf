provider "aws" {
  region = "us-east-1"
}


data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["cloudgeeks-eks-dev"]
  }

}


data "aws_subnets" "private_subnet_ids" {
  filter {
    name   = "tag:Name"
    values = ["cloudgeeks-eks-dev-private-*"]
  }
}




module "eks" {
  source = "../modules/eks"

  cluster_name = data.aws_vpc.vpc.tags.Name
  vpc_id       = data.aws_vpc.vpc.id
  vpc_owner_id = data.aws_vpc.vpc.owner_id
  subnet_ids   = data.aws_subnets.private_subnet_ids.ids
  tags = {
    Environment = "dev"
    Terraform   = "true"
  }

}