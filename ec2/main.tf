#Criar EC2

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