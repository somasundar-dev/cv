data "aws_route53_zone" "cv_website_zone" {
  name     = var.domain_name
  provider = aws.ap-south-1
}
