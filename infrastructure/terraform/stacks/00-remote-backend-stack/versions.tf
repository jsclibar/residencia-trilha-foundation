terraform {
  # Exige Terraform versão 1.10.0 ou superior, mas anterior à 2.0.0.
  required_version = ">= 1.10.0, < 2.0.0"

  required_providers {
    aws = {
      # Usa o provider AWS oficial da HashiCorp.
      source = "hashicorp/aws"

      # Aceita versões 6.x do provider.
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  # Região onde os recursos serão criados.
  region = var.aws_region

  # Perfil da AWS configurado na sua máquina.
  profile = var.aws_profile

  # Permite executar ações apenas nesta conta AWS.
  allowed_account_ids = [var.aws_account_id]
}