terraform {
  backend "s3" {
        bucket = "eks-bucket-321"
        key     = "maproject-2024/terraform.tfstate"
        region = "us-west-1"
  }
}
