output "route53_name_servers" {
  description = "Route53 nameservers — add these manually to Namecheap"
  value       = aws_route53_zone.r53_zone.name_servers
}