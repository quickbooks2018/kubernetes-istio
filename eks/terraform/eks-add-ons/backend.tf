### Backend ###
# S3
###############
# aws s3api create-bucket --bucket cloudgeekscaa-terraform --region us-east-1

terraform {
  backend "s3" {
    bucket = "cloudgeeksca-terraform"
    key    = "env/dev/cloudgeeks-dev-eks-add-ons.tfstate"
    region = "us-east-1"
    # dynamodb_table = "cloudgeeksca-dev-terraform-backend-state-lock"
  }
}