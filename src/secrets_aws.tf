# =============================================================================
# AWS SECRET ENGINE
# =============================================================================

resource "vault_aws_secret_backend" "aws" {
  count = var.enable_aws_engine ? 1 : 0

  path                      = var.aws_path
  description               = "AWS secret engine for dynamic credentials"
  access_key                = var.aws_access_key
  secret_key                = var.aws_secret_key
  region                    = var.aws_region
  default_lease_ttl_seconds = var.aws_default_lease_ttl
  max_lease_ttl_seconds     = var.aws_max_lease_ttl
}
