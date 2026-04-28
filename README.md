# Examen Final Módulo 3 - Despliegue de IaC en AWS con Terraform

## Objetivo del Proyecto
Diseñar e implementar una infraestructura funcional en AWS utilizando **Terraform** para desplegar una página web estática alojada en **Amazon S3 (Static Website Hosting)**. El proyecto sigue un enfoque **modular** y utiliza variables para evitar el "hardcoding", cumpliendo con las mejores prácticas de Infraestructura como Código (IaC).

## URL del Sitio Web Funcional
🚀 **Resultado del despliegue:** [http://examen-terraform-diana-2026.s3-website-us-east-1.amazonaws.com/](http://examen-terraform-diana-2026.s3-website-us-east-1.amazonaws.com/)

---

## Estructura del Proyecto (Modular)
Para este examen, el código se organizó de la siguiente manera:

- `main.tf`: Archivo raíz que invoca el módulo de S3 y define los tags obligatorios.
- `variables.tf`: Definición de variables globales (región, nombre del estudiante, etc.).
- `terraform.tfvars`: Valores asignados a las variables (personalización).
- `providers.tf`: Configuración del proveedor de AWS.
- `modules/s3_website/`: Carpeta que contiene la lógica específica del recurso S3.
- `index.html`: Archivo web solicitado con el mensaje de bienvenida.

## Comandos Ejecutados
Para validar este despliegue, se corrieron exitosamente los siguientes comandos:
1. `terraform init`: Inicialización del entorno y descarga de proveedores.
2. `terraform fmt`: Formateo de archivos para asegurar limpieza visual.
3. `terraform validate`: Validación de la sintaxis del código.
4. `terraform plan`: Generación del plan de ejecución para previsualizar cambios.
5. `terraform apply`: Creación real de los recursos en la nube de AWS.

## Explicación de Recursos Clave
- **AWS S3 Bucket**: Se creó un contenedor con nombre dinámico para almacenar los activos de la web.
- **Bucket Policy**: Se configuró una política de acceso público (`GetObject`) para permitir que la web sea visible desde cualquier navegador.
- **Bucket Website Configuration**: Activa la funcionalidad de hosting de S3 para servir el `index.html`.
- **Tags Obligatorios**: Todos los recursos incluyen etiquetas de `Environment`, `Owner` y `Project` para el control de gobernanza solicitado.