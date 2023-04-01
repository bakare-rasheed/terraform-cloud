# The entire section create a certiface, public zone, and validate the certificate using DNS method

# Create the certificate using a wildcard for all the domains created in oyindamola.gq
resource "aws_acm_certificate" "y20dev" {
  domain_name       = "*.y20dev.c1.biz"
  validation_method = "DNS"
}

# calling the hosted zone
data "aws_route53_zone" "y20dev" {
  name         = "y20dev.c1.biz"
  private_zone = false
}

# selecting validation method
resource "aws_route53_record" "y20dev" {
  for_each = {
    for dvo in aws_acm_certificate.y20dev.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.y20dev.zone_id
}

# validate the certificate through DNS method
resource "aws_acm_certificate_validation" "y20dev" {
  certificate_arn         = aws_acm_certificate.y20dev.arn
  validation_record_fqdns = [for record in aws_route53_record.y20dev : record.fqdn]
}

# create records for tooling
resource "aws_route53_record" "tooling" {
  zone_id = data.aws_route53_zone.y20dev.zone_id
  name    = "tooling.y20dev.c1.biz"
  type    = "A"

  alias {
    name                   = aws_lb.ext-alb.dns_name
    zone_id                = aws_lb.ext-alb.zone_id
    evaluate_target_health = true
  }
}

# create records for wordpress
resource "aws_route53_record" "wordpress" {
  zone_id = data.aws_route53_zone.y20dev.zone_id
  name    = "wordpress.tooling.y20dev.c1.biz"
  type    = "A"

  alias {
    name                   = aws_lb.ext-alb.dns_name
    zone_id                = aws_lb.ext-alb.zone_id
    evaluate_target_health = true
  }
}