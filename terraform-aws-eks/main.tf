
terraform
provider "aws" {
  region = var.aws_region
}

# Create IAM Role for EKS Cluster
resource "aws_iam_role" "eks_cluster" {
  name        = "${var.eks_cluster_name}-role"
  description = "EKS Cluster Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "(link unavailable)"
        }
        Effect = "Allow"
      }
    ]
  })
}

# Create IAM Role Policy Attachment for EKS Cluster
resource "aws_iam_role_policy_attachment" "eks_cluster" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster.name
}

# Create IAM Role for EKS Nodes
resource "aws_iam_role" "eks_nodes" {
  name        = "${var.eks_node_group_name}-role"
  description = "EKS Nodes Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "(link unavailable)"
        }
        Effect = "Allow"
      }
    ]
  })
}

# Create IAM Role Policy Attachment for EKS Nodes
resource "aws_iam_role_policy_attachment" "eks_nodes" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_nodes.name
}

# Create EKS Cluster
resource "aws_eks_cluster" "example" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.eks_cluster.arn

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  depends_on = [
    aws_iam_role.eks_cluster,
    aws_iam_role_policy_attachment.eks_cluster,
    aws_iam_role.eks_nodes,
    aws_iam_role_policy_attachment.eks_nodes
  ]
}

# Create EKS Node Group
resource "aws_eks_node_group" "example" {
  cluster_name    = aws_eks_cluster.example.name
  node_group_name = var.eks_node_group_name
  node_role_arn   = aws_iam_role.eks_nodes.arn

  scaling_config {
    desired_size = var.desired_node_count
    max_size     = var.max_node_count
    min_size     = var.min_node_count
  }

  instance_types = [var.instance_type]
  subnet_ids     = var.subnet_ids

  depends_on = [aws_eks_cluster.example]
}

# Addons
resource "aws_eks_addon" "coredns" {
  cluster_name = aws_eks_cluster.example.name
  addon_name   = "coredns"
  addon_version = var.coredns_version
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name = aws_eks_cluster.example.name
  addon_name   = "kube-proxy"
  addon_version = var.kube_proxy_version
}

resource "aws_eks_addon" "vpc_cni" {
  cluster_name = aws_eks_cluster.example.name
  addon_name   = "vpc-cni"
  addon_version = var.vpc_cni_version
}

resource "aws_eks_addon" "aws_alb" {
  cluster_name = aws_eks_cluster.example.name
  addon_name   = "aws-alb"
  addon_version = var.aws_alb_version
}

resource "aws_eks_addon" "aws_iam" {
  cluster_name = aws_eks_cluster.example.name
  addon_name   = "aws-iam"
  addon_version = var.aws_iam_version
}

resource "aws_eks_addon" "aws_ebs" {
  cluster_name = aws_eks_cluster.example.name
  addon_name   = "aws-ebs"
  addon_version = var.aws_ebs_version
}
