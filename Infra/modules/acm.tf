resource "aws_acm_certificate" "cv_website_certificate" {
  domain_name       = var.domain_name
  validation_method = "DNS"
  provider          = aws.us_east_1

  tags = {
    website = var.domain_name
  }

  lifecycle {
    create_before_destroy = true
  }
}

