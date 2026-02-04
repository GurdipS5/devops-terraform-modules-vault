# =============================================================================
# JWT/OIDC AUTHENTICATION
# =============================================================================

resource "vault_jwt_auth_backend" "oidc" {
  count = var.enable_oidc_auth ? 1 : 0

  type               = "oidc"
  path               = var.oidc_path
  oidc_discovery_url = var.oidc_discovery_url
  oidc_client_id     = var.oidc_client_id
  oidc_client_secret = var.oidc_client_secret
  default_role       = var.oidc_default_role
  description        = "OIDC authentication"

  tune {
    default_lease_ttl = var.oidc_default_lease_ttl
    max_lease_ttl     = var.oidc_max_lease_ttl
  }
}
