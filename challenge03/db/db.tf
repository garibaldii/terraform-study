resource "aws_instance" "db" {
  ami             = "ami-0f3caa1cf4417e51b"
  instance_type   = "t3.micro"
  tags = {
    Name = "my_db_server"
  }
}

output "instance_id" {
    value = aws_instance.db.private_ip
}