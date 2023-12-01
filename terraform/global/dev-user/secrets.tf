# Secrets Manager have 30 days trial https://aws.amazon.com/ru/secrets-manager/pricing/
resource "aws_secretsmanager_secret" "dev_user" {
  name                    = "dev-user"
  description             = var.AWS_SECRET_ACCESS_KEY
  recovery_window_in_days = 0
  tags                    = local.tags
}

resource "aws_secretsmanager_secret_version" "user_credentials" {
  secret_id     = aws_secretsmanager_secret.dev_user.id
  secret_string = jsonencode(local.credentials)
}
