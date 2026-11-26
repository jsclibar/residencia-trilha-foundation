output "frontend_s3_bucket_id" {
  value = aws_s3_bucket.frontend.id
}

output "frontend_cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.frontend.id
}

output "frontend_cloudfront_distribution_domain_name" {
  value = aws_cloudfront_distribution.frontend.domain_name
}

output "frontend_url" {
  value = "https://${trimsuffix(aws_route53_record.frontend.fqdn, ".")}"
}

output "frontend_www_url" {
  value = "https://${trimsuffix(aws_route53_record.frontend_www.fqdn, ".")}"
}

output "public_route53_zone_id" {
  value = data.aws_route53_zone.public.zone_id
}