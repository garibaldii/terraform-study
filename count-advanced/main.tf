provider "aws" {
  region = "us-east-1"
}

module "db" {
  source = "./db"
  server_names = [ "mariadb", "mysql", "postgre" ]
}

output "private_ips" {
  value = module.db.instance_id
}