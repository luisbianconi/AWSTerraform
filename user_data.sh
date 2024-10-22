#!/bin/bash
#Elevação de usuário
sudo su
#
yum update -y
#
yum install -y docker
#
service docker start
#
usermod -a -G docker ec2-user
#
#
docker run -dp 80:5000 luisbianconi/giropops-senhas:7.0
#
#
