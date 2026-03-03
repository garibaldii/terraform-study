provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "db" {
  ami = "ami-0f3caa1cf4417e51b"
  instance_type = "t3.micro"

}


resource "aws_instance" "web" {
  ami = "ami-0f3caa1cf4417e51b"
  instance_type = "t3.micro"
  depends_on = [ aws_instance.db ] #só inicia depois que o db inciar
}

#query dos nossos recursos provisionados, neste caso estamos procurando uma aws_instance cuja tag name seja = DB SERVER
data "aws_instance" "db_search" {
  filter {
    name = "tag:Name"
    values = [ "DB Server" ]
  }
}

output "db_servers" {
  value = data.aws_instance.db_search.availability_zone
}