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

data "aws_s3_bucket_policy" "existing_policy" {
  bucket = data.aws_s3_bucket.website_bucket.id
}

locals {
  existing_policy = jsondecode(data.aws_s3_bucket_policy.existing_policy.policy)

  new_statement = {
    Effect = "Allow"
    Principal = {
      AWS = aws_cloudfront_origin_access_identity.cloudfront_oai.iam_arn
    }
    Action   = "s3:GetObject"
    Resource = "${data.aws_s3_bucket.website_bucket.arn}/artifacts/${var.app_name}/${var.environment}/${var.current_version}/*"
  }

  merged_policy = {
    Version   = local.existing_policy.Version
    Statement = concat(local.existing_policy.Statement, [local.new_statement])
  }
}
