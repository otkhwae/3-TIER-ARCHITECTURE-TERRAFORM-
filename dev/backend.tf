
terraform {
  backend "s3" {
    bucket = "ot-dev-terraform-remote-state"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "ot-dev-terraform-state-lock"
    profile = "otkhwae"
  }
}


