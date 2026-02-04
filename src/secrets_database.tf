# =============================================================================
# DATABASE SECRET ENGINE
# =============================================================================

resource "vault_mount" "database" {
  count = var.enable_database_engine ? 1 : 0

  path        = var.database_path
  type        = "database"
  description = "Database secret engine for dynamic credentials"
}
