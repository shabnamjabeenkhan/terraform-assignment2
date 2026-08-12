variable "instance_type" {
  type        = string
  default = "t3.micro"
}

locals {
  instance_ami = "ami-01c952cfc86b7870d"
}

locals {
  instance_tag = "cloud_init_ec2"
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}