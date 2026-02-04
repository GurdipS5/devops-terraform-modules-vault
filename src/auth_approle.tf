# =============================================================================
# APPROLE AUTHENTICATION
# =============================================================================

resource "vault_auth_backend" "approle" {
  count = var.enable_approle_auth ? 1 : 0

  type        = "approle"
  path        = var.approle_path
  description = "AppRole authentication for applications"

  tune {
    default_lease_ttl = var.approle_default_lease_ttl
    max_lease_ttl     = var.approle_max_lease_ttl
  }
}
