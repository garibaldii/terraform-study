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