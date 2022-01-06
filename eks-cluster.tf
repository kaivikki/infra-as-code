# EKS Cluster IAM Role
resource "aws_iam_role" "team6EksClusterIAMRole" {
  name               = var.cluster-iam-role-name
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

# EKS Cluster IAM Role Policy:1
resource "aws_iam_role_policy_attachment" "team6EksClusterIAMRole-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.team6EksClusterIAMRole.name
}

# EKS Cluster IAM Role Policy:2
resource "aws_iam_role_policy_attachment" "team6EksClusterIAMRole-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.team6EksClusterIAMRole.name
}


# EKS Cluster
resource "aws_eks_cluster" "team6EksCluster" {
  name     = var.cluster-name
  role_arn = aws_iam_role.team6EksClusterIAMRole.arn
  vpc_config {
    security_group_ids = [data.aws_security_group.team6-security-group.id]
    subnet_ids         = data.aws_subnet_ids.team6-vpc-subnet.ids
  }
  depends_on = [
    aws_iam_role_policy_attachment.team6EksClusterIAMRole-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.team6EksClusterIAMRole-AmazonEKSVPCResourceController,
  ]
}
