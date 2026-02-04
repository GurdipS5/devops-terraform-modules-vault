# =============================================================================
# NAMESPACE OUTPUTS
# =============================================================================

output "namespace_paths" {
  description = "Paths of created namespaces (Enterprise only)"
  value       = [for ns in vault_namespace.namespaces : ns.path]
}

# =============================================================================
# SUMMARY OUTPUTS
# =============================================================================

output "enabled_auth_methods" {
  description = "List of enabled authentication methods"
  value = compact([
    var.enable_approle_auth ? "approle" : "",
    var.enable_kubernetes_auth ? "kubernetes" : "",
    var.enable_userpass_auth ? "userpass" : "",
    var.enable_ldap_auth ? "ldap" : "",
    var.enable_oidc_auth ? "oidc" : "",
  ])
}

output "enabled_secret_engines" {
  description = "List of enabled secret engines"
  value = compact([
    var.enable_kv_engine ? "kv-v2" : "",
    var.enable_pki_engine ? "pki" : "",
    var.enable_database_engine ? "database" : "",
    var.enable_aws_engine ? "aws" : "",
    var.enable_transit_engine ? "transit" : "",
    var.enable_ssh_engine ? "ssh" : "",
  ])
}
