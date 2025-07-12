data "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name
}

data "aws_route53_zone" "main" {
  name         = var.domain_name
  private_zone = false
}