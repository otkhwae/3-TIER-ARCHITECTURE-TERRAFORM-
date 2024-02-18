# create alb
resource "aws_alb" "app_load_balancer" {
  name = "${var.project_name}-alb"
  internal =  false
  load_balancer_type =  "application"
  security_groups = [var.alb_sg_id]
  subnets = [var.public_subnet_1a_id,var.public_subnet_1b_id]
  enable_deletion_protection = false

  tags ={
    Name = "${var.project_name}-alb"
  }
}

# create target group
resource "aws_alb_target_group" "alb_target_grp" {
  name = "${var.project_name}-tg"
  target_type = "ip"
  port =  80
  protocol = "HTTP" 
  vpc_id =  var.vpc_id

  health_check {
    enabled = true
    interval = 300
    path = "/"
    timeout = 60
    matcher = 200
    healthy_threshold = 5
    unhealthy_threshold = 5
  }

  lifecycle {
    create_before_destroy = true
  }
}

# create a listner port on port 80 with redirect action
resource "aws_alb_listener" "alb_http_listner" {
  load_balancer_arn =  aws_alb.app_load_balancer.arn
  port =  80
  protocol =  "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.alb_target_grp.arn
  }

  /*
  default_action {
    type = "redirect"

    redirect {
      port = 443
      protocol = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  */
}

/*
# CREATE A LISTNER ON PORT 443 WITH FORWARD ACTION
resource "aws_alb_listener" "alb_httpslistner" {
  load_balancer_arn =  aws_alb.app_load_balancer.arn
  port =  443
  protocol =  "HTTPS"
  ssl_policy = "ELBSecurityPolicy-2016-08"
  #certificate_arn = var.certificate_arn

  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.alb_target_grp.arn
  }
}
*/


