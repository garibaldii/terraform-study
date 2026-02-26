#Criar EC2 Com IP Estático

provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "ec2" {
  ami = "ami-0f3caa1cf4417e51b"
  instance_type = "t3.micro"
  tags = {
    Name = "my_ec2"
  }
  
}

resource "aws_eip" "elastic_ip" {
  instance = aws_instance.ec2.id
}

output "EIP" {
  value = aws_eip.elastic_ip.public_ip
}