provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

terraform {
  backend "s3" {
    bucket  = "nathan-tmp-tf-state"
    key     = "networking.tfstate"
    region  = "eu-west-1"
    profile = "nathan-tmp"
  }
}
