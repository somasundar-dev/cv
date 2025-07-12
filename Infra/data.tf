data "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name
}

data "aws_acm_certificate" "cert" {
  provider    = aws.us_east_1
  domain      = var.domain_name
  statuses    = ["ISSUED"]
  most_recent = true
}

data "aws_route53_zone" "main" {
  name         = var.domain_name
  private_zone = false
}