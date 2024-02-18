#================ alb security grp =======================
resource "aws_security_group" "alb_web_security_grp" {
    name = "alb_web_server_security_grp"
    description = "allow_web_traffic"
    vpc_id = var.vpc_id

    ingress {
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "HTTPS"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "alb security grp"
    }
}


#================ asg security grp =======================
resource "aws_security_group" "asg_security_grp" {
    name = "asg_security_grp"
    description = "allow_alb_web_traffic"
    vpc_id = var.vpc_id

    ingress {
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        security_groups = [aws_security_group.alb_web_security_grp.id]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "asg security grp"
    }
}

#================ ec2 security grp =======================
resource "aws_security_group" "ec2_security_grp" {
    name = "ec2_security_grp"
    description = "allow_ec2_web_traffic"
    vpc_id = var.vpc_id

    ingress {
            description = "HTTPS"
            from_port = 443
            to_port = 443
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "ec2 security grp"
    }
}
















