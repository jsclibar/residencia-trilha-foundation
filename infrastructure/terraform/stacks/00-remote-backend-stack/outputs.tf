# Mostra o nome do bucket S3 criado.
output "state_s3_bucket_id" {
  value = aws_s3_bucket.state.id
}

# Mostra a região onde o bucket está configurado.
output "state_s3_bucket_region" {
  value = var.aws_region
}
