terraform {
  required_providers {
    aws = {
      source   = "hashicorp/aws"
      version = "~> 4.5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "FirstInst" {
ami           = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  key_name = "Terrakp"

  tags = {
    "Name" = "InstanceA"
  }
  
}

resource "aws_instance" "SecInst" {
ami           = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  key_name = "Terrakp"

  tags = {
    "Name" = "InstanceB"
  }
  
}

