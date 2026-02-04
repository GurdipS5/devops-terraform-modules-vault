# =============================================================================
# KUBERNETES AUTHENTICATION
# =============================================================================

resource "vault_auth_backend" "kubernetes" {
  count = var.enable_kubernetes_auth ? 1 : 0

  type        = "kubernetes"
  path        = var.kubernetes_auth_path
  description = "Kubernetes authentication"

  tune {
    default_lease_ttl = var.kubernetes_default_lease_ttl
    max_lease_ttl     = var.kubernetes_max_lease_ttl
  }
}

resource "vault_kubernetes_auth_backend_config" "kubernetes" {
  count = var.enable_kubernetes_auth ? 1 : 0

  backend                = vault_auth_backend.kubernetes[0].path
  kubernetes_host        = var.kubernetes_host
  kubernetes_ca_cert     = var.kubernetes_ca_cert
  token_reviewer_jwt     = var.kubernetes_token_reviewer_jwt
  disable_iss_validation = var.kubernetes_disable_iss_validation
}
