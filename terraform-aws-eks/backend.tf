terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "eks/terraform.tfstate"
    region         = "us-esat-1"
    encrypt        = true
    dynamodb_table = "my-terraform-lock-table"
  }
}
