#Serve para avisar ao terraform que queremos sobrescrever sua configuração

terraform {
  backend "s3" {
    key = "terraform/tfstate.tfstate" #caminho para armazenar o arquivo, seria o prefixo, lembre-se que s3 nao possui hierarquia de objetos, apenas a fim de organizacao
    bucket = "terraform-course-remote-backend-2026"
    region = "us-east-1"
    access_key = ""
    secret_key = ""
  }
}
