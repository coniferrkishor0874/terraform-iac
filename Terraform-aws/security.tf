resource "aws_security_group" "allow_ssh" {
  name        = "allow_webport"
  description = "Allow SSH, HTTP, HTTPS inbound traffic"
  vpc_id      = aws_vpc.mainvpc.id

  dynamic "ingress" {
    for_each = local.inport
    content {
      description = "SSH, HTTP and HTTPS from VPC"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = local.outport
    content {
      from_port        = egress.value
      to_port          = egress.value
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  tags = {
    Name = "Allow Necessary port for webserver"
  }
}

locals {
  inport  = [22, 80, 443]
  outport = [22, 80, 443]
}