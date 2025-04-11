module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
  subnet_names = var.subnet_names
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./modules/ec2"
  Sg_id = module.sg.Sg_id
  subnet_id = module.vpc.subnet_id
}

module "alb" {
  source = "./modules/alb"
  Sg_id = module.sg.Sg_id
  subnet_id = module.vpc.subnet_id
  vpc_id = module.vpc.vpc_id
  ec2_instances = module.ec2.ec2_instances
}