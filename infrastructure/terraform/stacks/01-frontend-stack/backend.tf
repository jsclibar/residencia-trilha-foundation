# Armazena no s3 o estado do Terraform.

terraform {
  backend "s3" {
    bucket              = "residencia-foundation-state-files-637423180547"
    key                 = "residencia-foundation/01-frontend-stack.tfstate"
    region              = "us-east-1"
    profile             = "jsclibar-labs"
    allowed_account_ids = ["637423180547"]
    encrypt             = true
    use_lockfile        = true
  }
}
