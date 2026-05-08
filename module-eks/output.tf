# Load Balancer outputs
output "nginx_ingress_lb_dns" {
  description = "DNS name of the Nginx Ingress Load Balancer"
  value       = data.aws_lb.nginx_ingress.dns_name
}

output "nginx_lb_ip" {
  description = "IP type of the Nginx Ingress Load Balancer"
  value       = data.aws_lb.nginx_ingress.ip_address_type == "ipv4" ? data.aws_lb.nginx_ingress.dns_name : ""
}

output "nginx_ingress_load_balancer_hostname" {
  description = "Hostname of the Nginx Ingress Load Balancer"
  value       = data.aws_lb.nginx_ingress.dns_name
}

# EKS Cluster outputs - needed by root providers
output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = aws_eks_cluster.eks.endpoint
}

output "cluster_ca_certificate" {
  description = "EKS cluster CA certificate"
  value       = aws_eks_cluster.eks.certificate_authority[0].data
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.eks.name
}

output "node_security_group_id" {
  description = "Security group ID of the EKS node group"
  value       = aws_eks_cluster.eks.vpc_config[0].cluster_security_group_id
}