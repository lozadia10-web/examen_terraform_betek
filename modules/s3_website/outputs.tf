output "website_endpoint" {
  value       = aws_s3_bucket_website_configuration.hosting.website_endpoint
  description = "Endpoint del sitio web estático"
}