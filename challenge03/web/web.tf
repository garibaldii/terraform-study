
resource "aws_instance" "web" {
  ami                    = "ami-0f3caa1cf4417e51b"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [module.sg.web_traffic_id]
  user_data              = file("${path.module}/server-script.sh")
  tags = {
    Name = "my_web_server"
  }
}

module "sg" {
  source = "../sg"
}

output "instance_id" {
  value = aws_instance.web.id
}