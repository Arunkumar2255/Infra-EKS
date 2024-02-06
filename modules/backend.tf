terraform {
  backend "s3" {
        bucket = "lal-bucket-123"
        key     = "myproject022/terraform.tfstate"
        region = "us-west-2"
  }
}
