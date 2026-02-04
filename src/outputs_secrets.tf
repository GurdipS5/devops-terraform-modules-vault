# =============================================================================
# SECRET ENGINE OUTPUTS
# =============================================================================

output "kv_mount_path" {
  description = "Path of the KV v2 secret engine"
  value       = var.enable_kv_engine ? vault_mount.kv[0].path : null
}

output "kv_mount_accessor" {
  description = "Accessor of the KV v2 secret engine"
  value       = var.enable_kv_engine ? vault_mount.kv[0].accessor : null
}

output "pki_mount_path" {
  description = "Path of the PKI secret engine"
  value       = var.enable_pki_engine ? vault_mount.pki[0].path : null
}

output "pki_mount_accessor" {
  description = "Accessor of the PKI secret engine"
  value       = var.enable_pki_engine ? vault_mount.pki[0].accessor : null
}

output "pki_root_cert" {
  description = "Root CA certificate (PEM format)"
  value       = var.enable_pki_engine && var.pki_generate_root ? vault_pki_secret_backend_root_cert.root[0].certificate : null
  sensitive   = true
}

output "database_mount_path" {
  description = "Path of the Database secret engine"
  value       = var.enable_database_engine ? vault_mount.database[0].path : null
}

output "database_mount_accessor" {
  description = "Accessor of the Database secret engine"
  value       = var.enable_database_engine ? vault_mount.database[0].accessor : null
}

output "aws_mount_path" {
  description = "Path of the AWS secret engine"
  value       = var.enable_aws_engine ? vault_aws_secret_backend.aws[0].path : null
}

output "transit_mount_path" {
  description = "Path of the Transit secret engine"
  value       = var.enable_transit_engine ? vault_mount.transit[0].path : null
}

output "transit_mount_accessor" {
  description = "Accessor of the Transit secret engine"
  value       = var.enable_transit_engine ? vault_mount.transit[0].accessor : null
}

output "ssh_mount_path" {
  description = "Path of the SSH secret engine"
  value       = var.enable_ssh_engine ? vault_mount.ssh[0].path : null
}

output "ssh_mount_accessor" {
  description = "Accessor of the SSH secret engine"
  value       = var.enable_ssh_engine ? vault_mount.ssh[0].accessor : null
}
