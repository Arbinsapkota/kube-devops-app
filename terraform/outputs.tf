output "cluster_name" {
  value = aws_eks_cluster.arbin_cluster.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.arbin_cluster.endpoint
}

output "region" {
  value = "ap-northeast-2"
}