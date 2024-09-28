variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "eks_cluster_name" {
  type        = string
  description = "EKS Cluster Name"
}

variable "eks_node_group_name" {
  type        = string
  description = "EKS Node Group Name"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security Group IDs"
}

variable "instance_type" {
  type        = string
  description = "EC2 Instance Type"
}

variable "desired_node_count" {
  type        = number
  description = "Desired Node Count"
}

variable "min_node_count" {
  type        = number
  description = "Minimum Node Count"
}

variable "max_node_count" {
  type        = number
  description = "Maximum Node Count"
}

variable "coredns_version" {
  type        = string
  description = "CoreDNS Version"
  default     = "v1.8.4-eks-1-21-4"
}

variable "kube_proxy_version" {
  type        = string
  description = "Kube Proxy Version"
  default     = "v1.21.4-eks-1-21-4"
}

variable "vpc_cni_version" {
  type        = string
  description = "VPC CNI Version"
  default     = "v1.10.2-eks-1-21-4"
}

variable "aws_alb_version" {
  type        = string
  description = "AWS ALB Version"
  default     = "v2.4.1-eks-1-21-4"
}

variable "aws_iam_version" {
  type        = string
  description = "AWS IAM Version"
  default     = "v0.1.4-eks-1-21-4"
}

variable "aws_ebs_version" {
  type        = string
  description = "AWS EBS Version"
  default     = "v0.2.0-eks-1-21-4"
}
