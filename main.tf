# Configurando o Provider, após isso rodar terraform init
provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "securitygroup"{
    name = "securitygroup"
    description = "Libera Acesso HTTP"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

}
resource "aws_instance" "giropops-senhas" {
  ami               = "ami-06b21ccaeff8cd686"
  instance_type     = "t2.nano"
  user_data = file("user_data.sh")
  vpc_security_group_ids = [aws_security_group.securitygroup.id]
    tags = {
    Name = "giropops-senhas"
  }
}