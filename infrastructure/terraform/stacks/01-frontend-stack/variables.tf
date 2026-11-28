variable "assume_role" {
  type = object({
    region      = string
    role_arn    = string
    external_id = string
  })

  default = {
    region      = "us-east-1"
    role_arn    = "arn:aws:iam::637423180547:role/terraform-role"
    external_id = "662055de-5c10-4082-9db8-f3d9979a2b2f"
  }
}

variable "frontend_bucket" {
  type = object({
    name = string
  })

  default = {
    name = "residencia-foundation-frontend-637423180547"
  }
}

variable "domain_name" {
  description = "Nome do domínio da aplicação."
  type        = string
  default     = "jsclibar-labs.com.br"
}

variable "cloudfront_distribution" {
  type = object({
    default_root_object = string
    price_class         = string
    origin_id           = string
    oac_name            = string

  })

  default = {
    default_root_object = "index.html"
    price_class         = "PriceClass_100"
    origin_id           = "frontend-s3"
    oac_name            = "jsclibar-labs-frontend-oac"
  }
}

#variable "aws_region" {
#description = "Região da AWS onde os recursos serão criados."
#type        = string
#default     = "us-east-1"
#}

#variable "aws_profile" {
#description = "Perfil da AWS configurado localmente na máquina."
#type        = string
#default     = "jsclibar-labs"
#}

#variable "aws_account_id" {
#description = "ID da conta AWS do laboratório."
#type        = string
#default     = "637423180547"
#}

#variable "cloudfront_oac_name" {
#description = "Nome do Origin Access Control (OAC) do CloudFront."
#type        = string
#default     = "jsclibar-labs-frontend-oac"
#}