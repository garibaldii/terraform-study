#Criar instancia EC2 com SG

provider "aws" {
  region = "us-east-1"

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
  ingress {
    #Por que declarar duas vezes? Funciona como uma faixa, entao neste caso, estamos dizendop que essa regra só é aplicada para a porta 443(HHTPS)
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Outbound rules
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


