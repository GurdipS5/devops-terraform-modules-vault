# =============================================================================
# PKI SECRET ENGINE
# =============================================================================

resource "vault_mount" "pki" {
  count = var.enable_pki_engine ? 1 : 0

  path                      = var.pki_path
  type                      = "pki"
  description               = "PKI secret engine for certificate management"
  default_lease_ttl_seconds = var.pki_default_lease_ttl
  max_lease_ttl_seconds     = var.pki_max_lease_ttl
}

resource "vault_pki_secret_backend_root_cert" "root" {
  count = var.enable_pki_engine && var.pki_generate_root ? 1 : 0

  backend              = vault_mount.pki[0].path
  type                 = "internal"
  common_name          = var.pki_root_common_name
  ttl                  = var.pki_root_ttl
  format               = "pem"
  private_key_format   = "der"
  key_type             = var.pki_key_type
  key_bits             = var.pki_key_bits
  exclude_cn_from_sans = true
  organization         = var.pki_organization
  ou                   = var.pki_ou
  country              = var.pki_country
}
