#seria o importar code as infraestructure, caminho inverso. Importando toda uma estrutura já definida na sua conta aws. 

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}