# Definicion de la region de AWS
variable "region" {
  description = "Region de AWS donde se desplegara la infraestructura"
  type        = string
  default     = "us-east-1" # Region por defecto sugerida
}

# Variable para el nombre del Bucket (Requisito: Nombre dinamico)
variable "bucket_name" {
  description = "Nombre unico global para el bucket de S3"
  type        = string
}

# Variable para identificar al dueno del proyecto
variable "student_name" {
  description = "Nombre del estudiante para el tag Owner y el index.html"
  type        = string
}

# Variable para el nombre del proyecto
variable "project_name" {
  description = "Nombre del proyecto para los tags"
  type        = string
  default     = "Betek" # Segun el documento del examen [cite: 52]
}