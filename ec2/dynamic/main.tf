#Criar instancia EC2 com SG dinamico (múltiplas portas de forma automática)

provider "aws" {
  region = "us-east-1"

}

variable "ingress_rules" {
  type    = list(number)
  default = [80, 443]
}

variable "egress_rules" {
  type    = list(number)
  default = [80, 443, 25, 3306, 53, 8080]
}

resource "aws_instance" "ec2" {
  ami             = "ami-0f3caa1cf4417e51b"
  instance_type   = "t3.micro"
  security_groups = [aws_security_group.web_traffic.name]
  tags = {
    Name = "my_ec2"
  }
}

resource "aws_security_group" "web_traffic" {
  name = "Allow HTTPS"

  #Inbound rules
  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_rules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  #Outbound rules
  dynamic "egress" {
    iterator = port
    for_each = var.egress_rules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}


