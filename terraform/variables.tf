variable "aws_region" {
  description = "Region AWS utilizada para el despliegue."
  type        = string
  default     = "us-east-2"
}

variable "s3_bucket_name" {
  description = "Nombre del bucket de almacenamiento del inventario"
  type        = string
}