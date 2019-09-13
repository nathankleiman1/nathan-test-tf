# Terrraform Configuration
variable "aws_profile" {
  type = "string"
}

variable "aws_region" {
  type = "string"
}

variable "app_port" {
  type = "string"
}

variable "ecs_name" {
  type = "string"
}

variable "task_cpu" {
  type = "string"
}
variable "task_mem" {
  type = "string"
}
variable "task_desired" {
  type = "string"
}
variable "task_image" {
  type = "string"
}
variable "task_version" {
  type = "string"
}
variable "task_name" {
  type = "string"
}
variable "max_cpu" {
  type = "string"
}
variable "min_cpu" {
  type = "string"
}
variable "min_tasks" {
  type = "string"
}
variable "max_tasks" {
  type = "string"
}