output "secret_engine_path" {
  description = "The path of the created KV secret engine"
  value       = module.vault_kv.secret_engine_paths
}

output "policy_names" {
  description = "The names of the created policies"
  value       = module.vault_kv.policy_names
}
