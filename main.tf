provider "aws" {
  region = var.region
}

data "aws_ami" "webserver" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.20210813.1-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon"]
}

resource "aws_instance" "webserver" {
  ami           = data.aws_ami.webserver.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
