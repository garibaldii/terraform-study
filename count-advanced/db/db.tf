variable "server_names" {
  type = list(string)
}

resource "aws_instance" "db" {
  ami             = "ami-0f3caa1cf4417e51b"
  instance_type   = "t3.micro"
  count = length(var.server_names) #valor definido na variável
  tags = {
    Name = var.server_names[count.index]
  }
}

output "instance_id" {
    value = aws_instance.db.*.private_ip #retornar todos os ips privados das instancias criadas.
}