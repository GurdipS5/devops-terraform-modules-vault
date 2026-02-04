# =============================================================================
# AUDIT DEVICES
# =============================================================================

resource "vault_audit" "file" {
  count = var.enable_file_audit ? 1 : 0

  type = "file"

  options = {
    file_path = var.audit_file_path
    log_raw   = var.audit_log_raw
  }
}
