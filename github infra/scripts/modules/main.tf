resource "random_id" "random_id_prefix" {
  byte_length = 2
}

locals {
  production_availability_zones = ["${var.region}a"]
}

module "vpc" {
  source = "./vpc"

  region               = var.region
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr  = var.public_subnets_cidr
  private_subnet_cidr = var.private_subnets_cidr
  availability_zones   = "${local.production_availability_zones}"
}
module "ec2"{
    source ="./ec2"

ami_id_pri = var.ami_id_pri
ami_id_pub = var.ami_id_pub
pub_subnet_id = module.vpc.public_subnets_id
sg_id = [module.vpc.public_sg_id]
sg_private_id = [module.vpc.private_sg_id]
pri_subnet_id = module.vpc.private_subnets_id
instance_type= var.ins_type
}