provider "aws" {
  region = "us-east-1"
}

variable "number_of_servers" {
  type = number
}

resource "aws_instance" "db" {
  ami = "ami-0f3caa1cf4417e51b"
  instance_type = "t3.micro"
    count = var.number_of_servers
}