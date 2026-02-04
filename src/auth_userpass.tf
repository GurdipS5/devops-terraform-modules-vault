# =============================================================================
# USERPASS AUTHENTICATION
# =============================================================================

resource "vault_auth_backend" "userpass" {
  count = var.enable_userpass_auth ? 1 : 0

  type        = "userpass"
  path        = var.userpass_path
  description = "Username/password authentication for users"

  tune {
    default_lease_ttl = var.userpass_default_lease_ttl
    max_lease_ttl     = var.userpass_max_lease_ttl
  }
}
