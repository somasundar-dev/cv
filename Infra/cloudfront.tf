resource "aws_cloudfront_origin_access_identity" "cloudfront_oai" {
  comment = "Origin Access Identity for ${var.app_name}"
}

resource "aws_cloudfront_distribution" "cloudfront_distribution" {
  depends_on = [data.aws_acm_certificate.cert, data.aws_s3_bucket.website_bucket, aws_cloudfront_origin_access_identity.cloudfront_oai]

  origin {
    domain_name = data.aws_s3_bucket.website_bucket.bucket_regional_domain_name
    origin_id   = data.aws_s3_bucket.website_bucket.id
    origin_path = "/artifacts/${var.app_name}/${var.environment}/${var.current_version}"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.cloudfront_oai.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = data.aws_s3_bucket.website_bucket.id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  # viewer_certificate {
  #   cloudfront_default_certificate = true
  # }
  viewer_certificate {
    acm_certificate_arn            = data.aws_acm_certificate.cert.arn
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.2_2021"
    cloudfront_default_certificate = false
  }

  aliases = [var.domain_name]

}
