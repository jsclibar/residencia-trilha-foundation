locals {
  certificate_records = {
    for option in aws_acm_certificate.frontend.domain_validation_options : option.domain_name => {
      name   = option.resource_record_name
      type   = option.resource_record_type
      record = option.resource_record_value
    }
  }
}

resource "aws_route53_record" "certificate_validation" {
  for_each = toset([var.domain_name, "www.${var.domain_name}"])
  zone_id  = data.aws_route53_zone.public.zone_id
  name     = local.certificate_records[each.key].name
  type     = local.certificate_records[each.key].type
  ttl      = 60
  records  = [local.certificate_records[each.key].record]
}

resource "aws_acm_certificate_validation" "frontend" {
  certificate_arn = aws_acm_certificate.frontend.arn
  validation_record_fqdns = [
    for record in aws_route53_record.certificate_validation : record.fqdn
  ]
}
