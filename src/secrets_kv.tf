# =============================================================================
# KV VERSION 2 SECRET ENGINE
# =============================================================================

resource "vault_mount" "kv" {
  count = var.enable_kv_engine ? 1 : 0

  path        = var.kv_path
  type        = "kv"
  description = "KV Version 2 secret engine"

  options = {
    version = "2"
  }
}
