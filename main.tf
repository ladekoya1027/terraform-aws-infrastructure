provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "devops_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.devops_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_instance" "web_server" {
  ami = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"

  tags = {
    Name = "DevOps-Terraform-Server"
  }
}
