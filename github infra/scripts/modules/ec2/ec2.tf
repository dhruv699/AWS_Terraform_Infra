resource "aws_instance" "jumphost" {
  ami             = var.ami_id_pub
  subnet_id = var.pub_subnet_id
  vpc_security_group_ids = var.sg_id
  key_name        = var.pem_key1
  instance_type   = var.instance_type


}

resource "aws_instance" "priv" {
  ami             = var.ami_id_pri
  subnet_id = var.pri_subnet_id
  vpc_security_group_ids = var.sg_private_id
  key_name        = var.pem_key2
  instance_type   = var.instance_type

}