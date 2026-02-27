
  provider "aws" {
    region = "us-east-1"
  }

  module "web" {
    source = "./web"
  }

  module "eip" {
    source = "./eip"
    instance_id = module.web.instance_id
  }

  module "db" {
    source = "./db"
  }

