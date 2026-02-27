provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "my_rds" {
  db_name        = "my_db"
  identifier     = "my_first_rds"
  instance_class = "db.t4g.micro"
  engine         = "mariadb"
  engine_version = "11.8.5"
  #   username = conectar com back-end remoto, ou secrets manager da aws, ou proprio gerenciador de variaveis de amiente do terraform, que ainda nao vi
  #   password = mesma obs de cima ^^
  port = 3306
  allocated_storage = 20
  skip_final_snapshot = true 
}
