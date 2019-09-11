# Terrraform Configuration
variable "aws_profile" {
  type = "string"
}

variable "aws_region" {
  type = "string"
}


variable "vpc_availability_zones" {
  type = "list"
}

variable "vpc_name" {
  type = "string"
}

variable "vpc_cidr" {
  type = "string"
}
