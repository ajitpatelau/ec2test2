
# Project Title

Modules to provision 3 instances with the following properties passed in as input parameters:
provision in the following Availability Zones and Subnets.

| Subnet | Availability Zone |
|--------|-------------------|
| subnet-az-2a | ap-southeast-2a |
| subnet-az-2b | ap-southeast-2b |
| subnet-az-2c | ap-southeast-2c |


## Input Variable

To run this project, you will need to add the following input variables 

`ami_id`

`key_name`

`region`

`availability_zones`

`subnet`



## Usage/Examples

```javascript
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
```


## Authors

- [Created and maintained by ajitpatel] ajitpatel@hotmail.com (https://www.github.com/octokatherine)

## Input Variable

To run this project, you will need to add the following input variables 

`ami_id`

`key_name`

`region`

`availability_zones`

`subnet`

## Output Variable


`public_key`

`private_key`

`key-name`

`ec2-instance-id`
