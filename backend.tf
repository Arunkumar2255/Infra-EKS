terraform {
  backend "s3" {
        bucket = "eks-bucket-111"
        key     = "project-2024/terraform.tfstate"
        region = "us-east-1"
  }
}
