variable "bucket_name" {
  description = "Nombre unico para el bucket de S3"
  type        = string
}

variable "tags" {
  description = "Mapa de etiquetas para los recursos"
  type        = map(string)
}