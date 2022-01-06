##################### AWS REGION ########################
variable "aws_region" {
  default = "us-east-1"
}

##################### AWS VPC ########################
variable "cluster-vpc-name" {
  default = "team6-vpc"
  type    = string
}

variable "cluster-vpc-subnet-name" {
  default = "team6-vpc-subnet"
  type    = string
}

variable "cluster-vpc-internet-gateway-name" {
  default = "team6-vpc-internet-gateway"
  type    = string
}

variable "cluster-vpc-route-table-name" {
  default = "team6-vpc-route-table"
  type    = string
}

variable "cluster-security-group-name" {
  default = "team6-security-group"
  type    = string
}

##################### AWS EKS CLUSTER ########################

variable "cluster-iam-role-name" {
  default = "team6-eks-cluster-iam-role"
  type    = string
}

variable "cluster-name" {
  default = "team6-eks-cluster"
  type    = string
}


variable "cluster-node-group-iam-role-name" {
  default = "team6-eks-cluster-node-group-iam-role"
  type    = string
}


variable "cluster-node-group-name" {
  default = "team6-eks-cluster-node-group"
  type    = string
}

##################### AWS MKS CLUSTER ########################
variable "kafka-cluster-name" {
  default = "team6-kafka-clusterr"
  type    = string
}
variable "number_of_broker_nodes" {
  default = 2
  type    = number
}

##################### Team 6 Tag Name ########################
variable "tag-name" {
  default = "team6"
  type    = string
}
