provider "aws" {
  region = var.region
  profile = var.profile
}

module "vpc" {
  source = "./modules/vpc"
}

module "app" {
  source = "./modules/rds"
  vpc_security_group_ids  = module.vpc.vpc_security_group_ids
}


module "elastic-cache" {
  source          = "./modules/elastic-cache"
}


module "ec2" {
  source          = "./modules/app"
  private_subnets = module.vpc.private_subnets
  public_subnets  = module.vpc.public_subnets
  vpc_id          = module.vpc.vpc_id
}



module "alb" {
  source          = "./modules/alb"
  private_subnets = module.vpc.private_subnets
  public_subnets  = module.vpc.public_subnets
  vpc_id          = module.vpc.vpc_id
  instance_ids    = module.ec2.instance_ids
}