resource "aws_route53_zone" "r53_zone" {
  name          = var.domain-name
  comment       = "Managed by Terraform"
  force_destroy = true

  tags = {
    Name        = "${var.environment}-hosted-zone"
    Environment = var.environment
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = aws_route53_zone.r53_zone.zone_id
  name    = "bank.${var.domain-name}"
  type    = "CNAME"
  ttl     = 300
  records = [var.nginx_ingress_lb_dns]
}

resource "aws_route53_record" "backend" {
  zone_id = aws_route53_zone.r53_zone.zone_id
  name    = "bankapi.${var.domain-name}"
  type    = "CNAME"
  ttl     = 300
  records = [var.nginx_ingress_lb_dns]
}

resource "aws_route53_record" "argocd" {
  zone_id = aws_route53_zone.r53_zone.zone_id
  name    = "argocd.${var.domain-name}"
  type    = "CNAME"
  ttl     = 300
  records = [var.nginx_ingress_lb_dns]
}