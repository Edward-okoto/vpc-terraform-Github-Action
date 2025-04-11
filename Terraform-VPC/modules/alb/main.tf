
# Create ALB

resource "aws_lb" "alb" {
  name               = "Application-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.Sg_id]
  subnets            = var.subnet_id

}

# Listeners

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

# Target Group

resource "aws_lb_target_group" "tg" {
  name     = "alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Target Group Association

resource "aws_lb_target_group_attachment" "tga" {
  count = length(var.ec2_instances)
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.ec2_instances[count.index]
  port             = 80
}

