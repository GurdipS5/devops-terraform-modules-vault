output "approle_path" {
  description = "The path of the AppRole auth method"
  value       = module.vault_approle.auth_method_paths["approle"]
}

output "role_name" {
  description = "The name of the created AppRole"
  value       = vault_approle_auth_backend_role.app_role.role_name
}

output "role_id_command" {
  description = "Command to retrieve the Role ID"
  value       = "vault read auth/${module.vault_approle.auth_method_paths["approle"]}/role/${var.role_name}/role-id"
}

output "secret_id_command" {
  description = "Command to generate a Secret ID"
  value       = "vault write -f auth/${module.vault_approle.auth_method_paths["approle"]}/role/${var.role_name}/secret-id"
}
