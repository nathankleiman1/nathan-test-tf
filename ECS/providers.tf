provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

terraform {
  backend "s3" {
    bucket  = "nathan-tmp-tf-state"
    key     = "ecs.tfstate"
    region  = "eu-west-1"
    profile = "spotim-dev"
  }
}


data "terraform_remote_state" "networking_tfstate" {
  backend = "s3"
  config = {
    bucket = "nathan-tmp-tf-state"
    key = "networking.tfstate"
    region = "eu-west-1"
    profile = "spotim-dev"
  }
}
