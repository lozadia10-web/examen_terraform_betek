terraform {
  required_version = ">= 1.5" # Versión mínima de Terraform requerida 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Usamos la versión 5 del proveedor de AWS 
    }
  }
}

provider "aws" {
  region = var.region # Usamos la variable definida para la región 
}