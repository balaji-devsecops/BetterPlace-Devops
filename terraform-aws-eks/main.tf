module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnets         = var.subnets
  vpc_id          = var.vpc_id

  cluster_iam_role_name = aws_iam_role.eks_cluster_role.name

  workers_group_defaults = {
    instance_type = var.node_groups["eks_node_group_1"].instance_type
  # key_name      = var.node_groups["eks_node_group_1"].key_nam
  }

  node_groups = {
    eks_node_group_1 = {
      instance_type = var.node_groups["eks_node_group_1"].instance_type
      instance_profile_name  = aws_iam_instance_profile.eks_worker_instance_profile.name
      subnet_ids             = var.subnets
      desired_capacity       = var.node_groups["eks_node_group_1"].desired_capacity
      max_capacity           = var.node_groups["eks_node_group_1"].max_capacity
      min_capacity           = var.node_groups["eks_node_group_1"].min_capacity
    }
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy,
    aws_iam_role_policy_attachment.eks_service_policy,
    aws_iam_role_policy_attachment.eks_worker_policy,
    aws_iam_role_policy_attachment.eks_cni_policy,
    aws_iam_role_policy_attachment.eks_registry_policy,
    aws_iam_instance_profile.eks_worker_instance_profile,
  ]
}

output "cluster_id" {
  description = "The name/ID of the EKS cluster"
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group IDs attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}
