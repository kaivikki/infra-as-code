terraform {
  backend "s3" {
    bucket  = "team6-terraform-state"
    encrypt = true
    key     = "eks.tfstate"
    region  = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}

# Data Sources
data "aws_availability_zones" "available" {}

data "aws_vpc" "team6-vpc" {
  filter {
    name   = "tag:Name"
    values = [var.cluster-vpc-name]
  }
}

data "aws_subnet_ids" "team6-vpc-subnet" {
  vpc_id = data.aws_vpc.team6-vpc.id
}

data "aws_security_group" "team6-security-group" {
  name = var.cluster-security-group-name
}
