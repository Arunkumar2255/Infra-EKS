terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.23"
    }
  }
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}
data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

provider "aws" {
  region = "us-east-1"
}

resource "random_string" "suffix" {
  length  = 5
  special = false
}

###### root/main.tf
module "eks" {
  source                  = "./modules/eks"
  aws_public_subnet       = module.vpc.aws_public_subnet
  vpc_id                  = module.vpc.vpc_id
  cluster_name            = "module-eks-${random_string.suffix.result}"
  endpoint_public_access  = false
  endpoint_private_access = true
  public_access_cidrs     = ["0.0.0.0/0"]
  node_group_name         = "Node1"
  scaling_desired_size    = 1
  scaling_max_size        = 1
  scaling_min_size        = 1
  instance_types          = ["t2.small"]
  key_pair                = "EKS-CICD"
}

module "vpc" {
  source                  = "./modules/vpc"
  tags                    = "Node1"
  instance_tenancy        = "default"
  vpc_cidr                = "10.0.0.0/16"
  access_ip               = "0.0.0.0/0"
  public_sn_count         = 2
  public_cidrs            = ["10.0.1.0/24", "10.0.2.0/24"]
  map_public_ip_on_launch = true
  rt_route_cidr_block     = "0.0.0.0/0"

}

module "bastionhost" {
  source = "./modules/bastionhost"
  vpc_id = module.vpc.vpc_id
  key_name = "eks"
  subnet_id = module.vpc.aws_public_subnet
  ami_id = "ami-0c7217cdde317cfec"
  }
