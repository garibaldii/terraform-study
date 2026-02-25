variable "vpc_name" {
    type = string
    default = "my_vpc"  
}

variable "ssh_port" {
    type = number
    default = 22
}

variable "enabled" {
    type = bool
    default = true
}

variable "my_list" {
    type = list(string)
    default = [ "Value1", "Value2" ]
}

variable "my_map" {
    type = map
    default = {
        Key1 = "Value1",
        Key2 = "Value2"
    }
  
}

variable "input_name" {
    type = string
    description = "Set the name of the VPC" #Mostra uma mensagem userfriendly ao rodar terraform plan
  
}

# exemplos de uso

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.input_name #Faz o usuário digitar o nome da vpc pelo console ao dar plan...
  }

  #pegar nome de lista
  #tags = {
  # Name = var.my_list[0]...[1]...[2]
  #
  #}

  #pegar nome de map
  #tags = {
  # Name = var.map["Key1"]
  #
  #}
}

#O que queremos que seja exibido após dar apply num arquivo cuja tenha esse cara aqui, ele será exibido após a conclusão
output "my_output" {
    value = aws_vpc.my_vpc.id

}

variable "my_tuple" {
    type = tuple([string, number, string])
    default = [ "cat", 1, "dog" ]
}

variable "my_object" {
    type = object({
      name = string,
      port = list(number),
    })

    default = {
      name = "matheus",
        port = [ 22, 25, 80 ]
    }
  
}

