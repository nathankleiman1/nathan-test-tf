resource "aws_ecs_task_definition" "app" {
  family                   = "app"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "${var.task_cpu}"
  memory                   = "${var.task_mem}"

  container_definitions = <<DEFINITION
[
  {
    "cpu": ${var.task_cpu},
    "image": "${var.task_image}:${var.task_version}",
    "memory": ${var.task_mem},
    "name": "nginx",
    "networkMode": "awsvpc",
    "portMappings": [
      {
        "containerPort": ${var.app_port},
        "hostPort": ${var.app_port}
      }
    ]
  }
]
DEFINITION
}

resource "aws_ecs_service" "main" {
  name            = "ecs-service"
  cluster         = "${aws_ecs_cluster.ecs_cluster.id}"
  task_definition = "${aws_ecs_task_definition.app.arn}"
  desired_count   = "${var.task_desired}"
  launch_type     = "FARGATE"

  network_configuration {
    security_groups = ["${aws_security_group.ecs_tasks.id}"]
    subnets         = ["${data.terraform_remote_state.networking_tfstate.internal_subnet_ids}"]
  }

  load_balancer {
    target_group_arn = "${aws_lb_target_group.nginx_app.arn}"
    container_name   = "nginx"
    container_port   = "${var.app_port}"
  }
}