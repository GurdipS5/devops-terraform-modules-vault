output "secret_engine_paths" {
  description = "Map of created secret engine paths"
  value = {
    for k, v in vault_mount.secret_engine : k => v.path
  }
}

output "auth_method_paths" {
  description = "Map of configured authentication method paths"
  value = {
    for k, v in vault_auth_backend.auth_method : k => v.path
  }
}

output "policy_names" {
  description = "List of created policy names"
  value       = [for k, v in vault_policy.policy : v.name]
}

output "audit_device_paths" {
  description = "Map of enabled audit device paths"
  value = {
    for k, v in vault_audit.audit_device : k => v.path
  }
}
