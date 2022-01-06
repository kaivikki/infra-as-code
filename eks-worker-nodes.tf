# EKS Cluster Node Group IAM Role.
resource "aws_iam_role" "team6EksClusterNodeGroupIAMRole" {
  name               = var.cluster-node-group-iam-role-name
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

# EKS Cluster Node Group IAM Role Policy:1
resource "aws_iam_role_policy_attachment" "team6EksClusterNodeGroupIAMRole-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.team6EksClusterNodeGroupIAMRole.name
}

# EKS Cluster Node Group IAM Role Policy:2
resource "aws_iam_role_policy_attachment" "team6EksClusterNodeGroupIAMRole-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.team6EksClusterNodeGroupIAMRole.name
}

# EKS Cluster Node Group IAM Role Policy:3
resource "aws_iam_role_policy_attachment" "team6EksClusterNodeGroupIAMRole-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.team6EksClusterNodeGroupIAMRole.name
}

# EKS Cluster Node Group
resource "aws_eks_node_group" "team6EksClusterNodeGroup" {
  node_group_name = var.cluster-node-group-name
  node_role_arn   = aws_iam_role.team6EksClusterNodeGroupIAMRole.arn
  subnet_ids      = data.aws_subnet_ids.team6-vpc-subnet.ids
  cluster_name    = aws_eks_cluster.team6EksCluster.name
  instance_types  = ["t3.small"]

  scaling_config {
    desired_size = 3
    max_size     = 3
    min_size     = 3
  }

  depends_on = [
    aws_iam_role_policy_attachment.team6EksClusterNodeGroupIAMRole-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.team6EksClusterNodeGroupIAMRole-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.team6EksClusterNodeGroupIAMRole-AmazonEC2ContainerRegistryReadOnly,
  ]
}
