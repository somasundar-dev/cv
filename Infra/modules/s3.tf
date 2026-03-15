resource "aws_s3_bucket" "website_bucket" {
  bucket   = var.bucket_name
  provider = aws.ap-south-1
}

resource "null_resource" "upload_angular_app" {
  depends_on = [aws_s3_bucket.website_bucket]
  provisioner "local-exec" {
    command = "aws s3 sync ../../src/dist/cv/browser/ s3://${aws_s3_bucket.website_bucket.id}/"
  }

  triggers = {
    version = timestamp()
  }
}

# Set up a redirect or "current" pointer using an S3 object
resource "aws_s3_object" "current_redirect" {
  bucket   = aws_s3_bucket.website_bucket.id
  key      = "index.html"
  provider = aws.ap-south-1

  source       = "../../src/dist/cv/browser/index.html"
  etag         = filemd5("../../src/dist/cv/browser/index.html")
  content_type = "text/html"

  depends_on = [null_resource.upload_angular_app]
}
