terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

##Instances

resource "aws_instance" "FirstInst" {
  ami                    = "ami-04505e74c0741db8d"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "Terrakp"
  vpc_security_group_ids = [aws_security_group.sg8080.id]

  user_data = <<-EOF
  #!/bin/bash
  echo "Hello World" > index.html
  nohup busybox httpd -f -p 8080 &
  EOF

  tags = {
    "Name" = "InstanceA"
  }

}

resource "aws_instance" "SecInst" {
  ami               = "ami-04505e74c0741db8d"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name          = "Terrakp"

  tags = {
    "Name" = "InstanceB"
  }

}

resource "aws_instance" "ThirdInst" {
  ami               = "ami-04505e74c0741db8d"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name          = "Terrakp"

  tags = {
    "Name" = "InstanceC"
  }

}

##Security Groups

resource "aws_security_group" "sg8080" {
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
