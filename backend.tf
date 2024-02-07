terraform {
  backend "s3" {
        bucket = "eks-bucket-666"
        key     = "myproject-2024/terraform.tfstate"
        region = "us-west-2"
  }
}
