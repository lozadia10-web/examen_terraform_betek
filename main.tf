# Llamada al módulo que creamos para el sitio web
module "s3_website" {
  source      = "./modules/s3_website"
  bucket_name = var.bucket_name
  
  # Mapa de tags obligatorios según el examen 
  tags = {
    Environment = "dev"
    Owner       = var.student_name
    Project     = "Betek"
  }
}

# Salida para obtener la URL al finalizar el despliegue 
output "website_url" {
  value       = module.s3_website.website_endpoint
  description = "La URL para acceder a la página web"
}