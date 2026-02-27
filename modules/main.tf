provider "aws" {
    region = "us-east-1"
}


module "ec2_module" {
  source = "./ec2"
  ec2_name = "Name From Module"
}

output "module_output" {
  value = module.ec2_module.instance_id  
}


#Modules é uma forma de criar IAC através de classes, basicamente, você importa através
#do caminho do arquivo, especifica um nome para ele e importa suas funcionalidades através de
#um único init. Também existe a possibilidade de importar modulos remotos através do terraform registry.

#este é um exemplo:


# module "vpc" {
#   source = "terraform-aws-modules/vpc/aws"

#   name = "my-vpc"
#   cidr = "10.0.0.0/16"

#   azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
#   private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#   public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

#   enable_nat_gateway = true
#   enable_vpn_gateway = true

#   tags = {
#     Terraform = "true"
#     Environment = "dev"
#   }
# }

