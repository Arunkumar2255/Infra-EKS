terraform {
  backend "s3" {
        bucket = "ar-bucket-111"
        key     = "mypro077/terraform.tfstate"
        region = "ap-southeast-1"
  }
}
