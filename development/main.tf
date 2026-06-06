provider "aws" {
  region = var.region
}

# IAM module
module "iam" {
  source = "../modules/iam"

  user_names = ["dev-user1", "dev-user2"]
  group_name = "dev-group"

  policies = [
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
    "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
  ]
}

# VPC module
module "vpc" {
  source = "../modules/vpc"

  name = "dev-vpc"
  cidr = "10.0.0.0/16"

  azs = ["ap-south-1a", "ap-south-1b"]

  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}

# EC2 module
module "ec2" {
  source = "../modules/ec2"

  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnets[0]
  key_name      = "terraform-key"
}

output "usernames" {
  value = module.iam.iam_user_names
}

output "passwords" {
  value     = module.iam.iam_user_passwords
  sensitive = true
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ec2_id" {
  value = module.ec2.ec2_id
}