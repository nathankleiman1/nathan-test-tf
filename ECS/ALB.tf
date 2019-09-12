
resource "aws_security_group" "lb-sg" {
  name        = "alb-sg"
  vpc_id      = "${data.terraform_remote_state.networking_tfstate.vpc_id}"

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_lb" "ecs-alb" {
  load_balancer_type = "application"
  internal           = false
  name            = "ecs-alb"
  subnets         = ["${data.terraform_remote_state.networking_tfstate.external_subnet_ids}"]
  security_groups = ["${aws_security_group.lb-sg.id}"]
}

resource "aws_lb_target_group" "nginx_app" {
  name        = "nginx-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = "${data.terraform_remote_state.networking_tfstate.vpc_id}"
  target_type = "ip"
}

# Redirect all traffic from the ALB to the target group
resource "aws_lb_listener" "http" {
  load_balancer_arn = "${aws_lb.ecs-alb.arn}"
  port              = "80"

  default_action {
    target_group_arn = "${aws_lb_target_group.nginx_app.arn}"
    type             = "forward"
  }
}