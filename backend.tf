terraform {
  backend "s3" {
        bucket = "ar-bucket-143"
        key     = "mypro-24/terraform.tfstate"
        region = "ap-southeast-1"
  }
}