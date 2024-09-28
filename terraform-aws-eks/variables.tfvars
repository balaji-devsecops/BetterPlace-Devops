region         = "us-east-1"
cluster_name   = "my-eks-cluster"
cluster_version = "1.28"
vpc_id         = "vpc-1234567890abcdef0" 
subnets        = ["subnet-12345678", "subnet-87654321", "subnet-1a2b3c4d"]

node_groups = {
  eks_node_group_1 = {
    desired_capacity = 3
    max_capacity     = 3
    min_capacity     = 3
    instance_type    = "t3.medium"
    key_name         = "my-key-pair"  ## kay pair name
  }
}
