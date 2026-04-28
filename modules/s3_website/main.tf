# 1. Definicion del bucket de S3 con nombre dinamico
resource "aws_s3_bucket" "website" {
  bucket = var.bucket_name
  tags   = var.tags # Se aplican los tags obligatorios (Environment, Owner, Project)
}

# 2. Configuracion para que el bucket funcione como un sitio web estatico
resource "aws_s3_bucket_website_configuration" "hosting" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html" # Archivo principal de la web
  }
}

# 3. Subida del archivo index.html al bucket
resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.website.id
  key          = "index.html"
  source       = "index.html" # Busca el archivo en la raiz de tu proyecto
  content_type = "text/html"  # Importante para que el navegador lo renderice como web
  tags         = var.tags
}

# 4. Desactivar el bloqueo de acceso publico (Requisito para que la web se vea)
resource "aws_s3_bucket_public_access_block" "public_check" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# 5. Politica de acceso para permitir que cualquier persona lea los archivos
resource "aws_s3_bucket_policy" "allow_public_access" {
  bucket = aws_s3_bucket.website.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.website.arn}/*"
      },
    ]
  })
  
  # Espera a que se desactive el bloqueo antes de aplicar la politica
  depends_on = [aws_s3_bucket_public_access_block.public_check]
}