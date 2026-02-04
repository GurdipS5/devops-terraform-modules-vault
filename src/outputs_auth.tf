# =============================================================================
# AUTH METHOD OUTPUTS
# =============================================================================

output "approle_auth_path" {
  description = "Path of the AppRole auth method"
  value       = var.enable_approle_auth ? vault_auth_backend.approle[0].path : null
}

output "approle_auth_accessor" {
  description = "Accessor of the AppRole auth method"
  value       = var.enable_approle_auth ? vault_auth_backend.approle[0].accessor : null
}

output "kubernetes_auth_path" {
  description = "Path of the Kubernetes auth method"
  value       = var.enable_kubernetes_auth ? vault_auth_backend.kubernetes[0].path : null
}

output "kubernetes_auth_accessor" {
  description = "Accessor of the Kubernetes auth method"
  value       = var.enable_kubernetes_auth ? vault_auth_backend.kubernetes[0].accessor : null
}

output "userpass_auth_path" {
  description = "Path of the Userpass auth method"
  value       = var.enable_userpass_auth ? vault_auth_backend.userpass[0].path : null
}

output "userpass_auth_accessor" {
  description = "Accessor of the Userpass auth method"
  value       = var.enable_userpass_auth ? vault_auth_backend.userpass[0].accessor : null
}

output "ldap_auth_path" {
  description = "Path of the LDAP auth method"
  value       = var.enable_ldap_auth ? vault_ldap_auth_backend.ldap[0].path : null
}

output "ldap_auth_accessor" {
  description = "Accessor of the LDAP auth method"
  value       = var.enable_ldap_auth ? vault_ldap_auth_backend.ldap[0].accessor : null
}

output "oidc_auth_path" {
  description = "Path of the OIDC auth method"
  value       = var.enable_oidc_auth ? vault_jwt_auth_backend.oidc[0].path : null
}

output "oidc_auth_accessor" {
  description = "Accessor of the OIDC auth method"
  value       = var.enable_oidc_auth ? vault_jwt_auth_backend.oidc[0].accessor : null
}
