
terraform {
  backend "s3" {
    bucket = "ot-staging-terraform-remote-state"
    key    = "staging/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "ot-staging-terraform-state-lock"
    profile = "otkhwae"
  }
}


