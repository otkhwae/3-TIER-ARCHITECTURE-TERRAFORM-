
terraform {
  backend "s3" {
    bucket = "ot-prod-terraform-remote-state"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "ot-prod-terraform-state-lock"
    profile = "otkhwae"
  }
}


