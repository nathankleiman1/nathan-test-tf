# Terrraform Configuration
aws_region = "eu-west-1"
aws_profile = "nathan-tmp"

app_port = "80"
ecs_name = "nathan_ecs_cluster"

task_name= "nginx"
task_cpu = "256"
task_mem = "512"
task_desired = "1"
task_image = "nathankleiman1/nginx"
task_version = "32"
max_cpu = "60"
min_cpu = "20"
min_tasks = "1"
max_tasks = "3"