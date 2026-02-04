output "secret_engines" {
  description = "Map of all secret engine paths"
  value       = module.vault_complete.secret_engine_paths
}

output "auth_methods" {
  description = "Map of all authentication method paths"
  value       = module.vault_complete.auth_method_paths
}

output "policies" {
  description = "List of all created policies"
  value       = module.vault_complete.policy_names
}

output "transit_key" {
  description = "Transit encryption key name"
  value       = vault_transit_secret_backend_key.app_key.name
}

output "approle_name" {
  description = "AppRole name"
  value       = vault_approle_auth_backend_role.app.role_name
}

output "userpass_login_command" {
  description = "Command to login with userpass"
  value       = "vault login -method=userpass username=developer password=<password>"
}
