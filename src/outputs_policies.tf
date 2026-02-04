# =============================================================================
# POLICY OUTPUTS
# =============================================================================

output "admin_policy_name" {
  description = "Name of the admin policy"
  value       = var.create_admin_policy ? vault_policy.admin[0].name : null
}

output "readonly_policy_name" {
  description = "Name of the read-only policy"
  value       = var.create_readonly_policy ? vault_policy.readonly[0].name : null
}

output "application_policy_names" {
  description = "Names of the application policies"
  value       = [for policy in vault_policy.application : policy.name]
}
