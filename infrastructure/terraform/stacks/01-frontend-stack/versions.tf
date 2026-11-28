terraform {
  required_version = ">= 1.10.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# provider "aws" {
#   # Região onde os recursos serão criados.
#   region = var.aws_account_information.region
#
#   # Perfil da AWS configurado na sua máquina.
#   profile = var.aws_account_information.profile
#
#   # Permite executar ações apenas nesta conta AWS.
#   allowed_account_ids = [var.aws_account_information.account_id]
# }

provider "aws" {
  region = var.assume_role.region

  assume_role {
    role_arn    = var.assume_role.role_arn
    external_id = var.assume_role.external_id
  }
}