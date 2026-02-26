#Criar EC2 Com IP Estático

provider "aws" {
  region = "us-east-1"
}

variable "ingress_rules" {
  type    = list(number)
  default = [80, 443]
}


resource "aws_instance" "web" {
  ami                    = "ami-0f3caa1cf4417e51b"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.web_traffic.id]
  user_data              = file("server-script.sh")
  tags = {
    Name = "my_ec2"
  }
}

resource "aws_eip" "elastic_ip" {
  instance = aws_instance.web.id
}

resource "aws_security_group" "web_traffic" {
  name = "Allow web traffic"

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
}

output "PublicIP" {
  value = aws_eip.elastic_ip.public_ip
}
