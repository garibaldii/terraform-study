variable "ingress_rules" {
  type    = list(number)
  default = [80, 443]
}

resource "aws_security_group" "web_traffic" {
  name = "Allow web traffic"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_rules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "web_traffic_id" {
  value = aws_security_group.web_traffic.id
}