terraform {
  backend "s3" {
        bucket = "ar-bucket-143"
        key     = "myproject022/terraform.tfstate"
        region = "ap-southeast-1"
  }
}
