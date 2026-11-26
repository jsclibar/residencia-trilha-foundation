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

variable "frontend_bucket_name" {
  description = "Nome do bucket S3 que armazena o frontend da aplicação."
  type        = string
  default     = "residencia-trilha-foundation-frontend-637423180547"
}

variable "domain_name" {
  description = "Nome do domínio da aplicação."
  type        = string
  default     = "jsclibar-labs.com.br"
}

variable "cloudfront_oac_name" {
  description = "Nome do Origin Access Control (OAC) do CloudFront."
  type        = string
  default     = "jsclibar-labs-frontend-oac"
}