resource "aws_security_group" "ecs_tasks" {
  name        = "ecs-tasks"
  description = "allow inbound access from the ALB only"
  vpc_id      = "${data.terraform_remote_state.networking_tfstate.vpc_id}"

  ingress {
    protocol        = "tcp"
    from_port       = "${var.app_port}"
    to_port         = "${var.app_port}"
    security_groups = ["${aws_security_group.lb-sg.id}"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.ecs_name}"
}