### Backend ###
# S3
###############
# aws s3api create-bucket --bucket cloudgeeksca-terraform --region us-east-1
# aws s3api put-bucket-versioning --bucket cloudgeeksca-terraform --versioning-configuration Status=Enabled
terraform {
  backend "s3" {
    bucket = "cloudgeeksca-terraform"
    key    = "env/dev/cloudgeeks-dev-eks.tfstate"
    region = "us-east-1"
    # dynamodb_table = "cloudgeeksca-dev-terraform-backend-state-lock"
  }
}