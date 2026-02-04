# =============================================================================
# LDAP AUTHENTICATION
# =============================================================================

resource "vault_ldap_auth_backend" "ldap" {
  count = var.enable_ldap_auth ? 1 : 0

  path         = var.ldap_path
  url          = var.ldap_url
  userdn       = var.ldap_userdn
  userattr     = var.ldap_userattr
  groupdn      = var.ldap_groupdn
  groupfilter  = var.ldap_groupfilter
  groupattr    = var.ldap_groupattr
  binddn       = var.ldap_binddn
  bindpass     = var.ldap_bindpass
  insecure_tls = var.ldap_insecure_tls
  starttls     = var.ldap_starttls
  description  = "LDAP authentication"
}
