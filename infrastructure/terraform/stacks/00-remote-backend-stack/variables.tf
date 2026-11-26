variable "aws_region" {
  description = "Região da AWS onde os recursos serão criados."
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "Perfil da AWS configurado localmente na máquina."
  type        = string
  default     = "jsclibar-labs"
}

variable "aws_account_id" {
  description = "ID da conta AWS do laboratório."
  type        = string
  default     = "637423180547"
}

variable "state_bucket_name" {
  description = "Nome do bucket S3 que armazena o state do Terraform."
  type        = string
  default     = "residencia-foundation-state-files-637423180547"
}


