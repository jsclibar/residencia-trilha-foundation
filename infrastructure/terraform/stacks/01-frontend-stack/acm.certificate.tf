# Solicitando um certificado SSL para o domínio jsclibar-labs.com.br e www.jsclibar-labs.com.br usando o AWS ACM (AWS Certificate Manager).
resource "aws_acm_certificate" "frontend" {
  domain_name               = var.domain_name
  subject_alternative_names = ["www.${var.domain_name}"]
  validation_method         = "DNS"

  # Essa função de ciclo de vida garante que o certificado seja criado antes de ser destruído, evitando problemas de disponibilidade durante a atualização do certificado.
  lifecycle {
    create_before_destroy = true
  }
}
