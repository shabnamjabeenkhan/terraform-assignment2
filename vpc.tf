# Creating VPC
resource "aws_vpc" "vpc_aws" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "cloud_init_vpc"
  }
}

# Creating Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc_aws.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public_subnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "coderco_gw" {
  vpc_id = aws_vpc.vpc_aws.id

  tags = {
    Name = "coderco_igw"
  }
}

# Route Table and Routes
resource "aws_route_table" "aws_routeTable" {
  vpc_id = aws_vpc.vpc_aws.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.coderco_gw.id
  }

  tags = {
    Name = "coderco_routeTable"
  }
}

# Route Table Association
resource "aws_route_table_association" "example" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.aws_routeTable.id
}

# Security Groups
resource "aws_security_group" "sg_rules" {
  name   = "cloud_init_sg_rules"
  vpc_id = aws_vpc.vpc_aws.id
}

resource "aws_vpc_security_group_ingress_rule" "cloud_init_inbound" {
  security_group_id = aws_security_group.sg_rules.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "cloud_init_outbound" {
  security_group_id = aws_security_group.sg_rules.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}





