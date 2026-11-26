# Cria um bucket S3.
resource "aws_s3_bucket" "state" {
  # "aws_s3_bucket" é o tipo de recurso reconhecido pelo provider AWS.
  # "state" é um nome interno escolhido por você para referenciar o recurso
  # em outros trechos do Terraform, como aws_s3_bucket.state.id.
  bucket = var.state_bucket_name

  lifecycle {
    # Impede que o Terraform exclua o bucket.
    # Para permitir a exclusão, remova esta configuração ou defina como false.
    prevent_destroy = true
  }
}

# Configura o bloqueio de acesso público para o bucket.
resource "aws_s3_bucket_public_access_block" "state" {
  # Associa esta configuração ao bucket criado acima.
  bucket = aws_s3_bucket.state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Define quem será o proprietário dos objetos e se as ACLs serão usadas.
resource "aws_s3_bucket_ownership_controls" "state" {
  # Associa esta configuração ao bucket criado acima.
  bucket = aws_s3_bucket.state.id

  rule {
    # O dono do bucket também será dono de todos os objetos.
    # As ACLs ficam desativadas; o acesso é controlado por políticas e IAM.
    object_ownership = "BucketOwnerEnforced"
  }
}

# Configura a criptografia padrão dos objetos armazenados no bucket.
resource "aws_s3_bucket_server_side_encryption_configuration" "state" {
  # Associa esta configuração ao bucket criado acima.
  bucket = aws_s3_bucket.state.id

  rule {
    apply_server_side_encryption_by_default {
      # Usa SSE-S3, a criptografia gerenciada pelo próprio Amazon S3 com AES-256.
      sse_algorithm = "AES256"
    }
  }
}

# Ativa o versionamento dos objetos do bucket.
resource "aws_s3_bucket_versioning" "state" {
  # Associa esta configuração ao bucket criado acima.
  bucket = aws_s3_bucket.state.id

  versioning_configuration {
    # Mantém versões anteriores quando um objeto é substituído ou excluído,
    # permitindo recuperar versões anteriores.
    status = "Enabled"
  }
}
