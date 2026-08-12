resource "aws_instance" "cloud_init" {
  ami                         = local.instance_ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  user_data                   = file("${path.module}/cloud-init.yaml")

  tags = {
    Name = local.instance_tag
  }
}
