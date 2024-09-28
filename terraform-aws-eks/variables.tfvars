aws_region         = "us-east-2"
eks_cluster_name   = "example-eks-cluster"
eks_node_group_name = "example-eks-node-group"
vpc_id             = "vpc-0123456789abcdef0"
subnet_ids         = ["subnet-0123456789abcdef0", "subnet-0123456789abcdef1"]
security_group_ids = ["sg-0123456789abcdef0", "sg-0123456789abcdef1"]
instance_type      = "t2.small"
desired_node_count = 3
min_node_count     = 3
max_node_count     = 5

# EKS Cluster version 1.28
kubernetes_version = "1.28"

coredns_version    = "v1.10.3-eks-1-28-1"
kube_proxy_version = "v1.28.10-eks-1-28-1"
vpc_cni_version    = "v1.12.3-eks-1-28-1"
aws_alb_version    = "v2.5.2-eks-1-28-1"
aws_iam_version    = "v0.2.1-eks-1-28-1"
aws_ebs_version    = "v0.3.1-eks-1-28-1"
