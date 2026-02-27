variable "ec2_name" {
  type = string
}

resource "aws_instance" "ec2" {
  ami = "ami-0f3caa1cf4417e51b"
  instance_type = "t3.micro"
  tags = {
    Name = var.ec2_name
  }
}

output "instance_id" {
  value = aws_instance.ec2.id
}