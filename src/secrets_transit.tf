# =============================================================================
# TRANSIT SECRET ENGINE
# =============================================================================

resource "vault_mount" "transit" {
  count = var.enable_transit_engine ? 1 : 0

  path        = var.transit_path
  type        = "transit"
  description = "Transit secret engine for encryption as a service"
}
