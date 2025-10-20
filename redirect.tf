resource "aws_s3_bucket" "redirect" {
  bucket = var.domain_name
}

# Redirect from "https://site.com" to "https://www.site.com"
resource "aws_s3_bucket_website_configuration" "redirect" {
  bucket = aws_s3_bucket.redirect.id

  redirect_all_requests_to {
    host_name = "www.${var.domain_name}"
    protocol  = "https"
  }
}
