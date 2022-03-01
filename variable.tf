### Define the variables ###
variable "ami" {
  default = "ami-0b7dcd6e6fd797935"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  default = "Contigo"
}

variable "region" {
  default = "ap-southeast-2"
}

# specify 3 availability zones from the region as per request
variable "availability_zones" {
  default = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
}

#specify 3 subnet name tag as per request
variable "subnet" {
  type = list  
  default = ["subnet-az-2a","subnet-az-2b", "subnet-az-2c"]
  description = "Names of subnets"
}
