terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

# Create a VPC
resource "aws_vpc" "primary" {
  cidr_block = "192.168.0.0/16"

  tags = {
    Name = "primary"
  }
}

# Create a subnet in each availability zone in the VPC. 
resource "aws_subnet" "subnet" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.primary.id
  cidr_block              = cidrsubnet("192.168.0.0/16", 8, count.index)
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true 
 tags = {
    Name = var.subnet[count.index],
    }
}

# Creat an instance in each subnet
resource "aws_instance" "ec2" {
  count                       = length(var.availability_zones)
  ami                         = var.ami
  associate_public_ip_address = true
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.subnet[count.index].id
  key_name                    = var.key_name

  tags = {
    Name = "appserver-${count.index}"
  }
}

### Define the outputs ###
output "ec2-instance-id" {
  value = aws_instance.ec2.*.arn
  
}

