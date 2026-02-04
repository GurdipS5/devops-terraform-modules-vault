# =============================================================================
# SSH SECRET ENGINE
# =============================================================================

resource "vault_mount" "ssh" {
  count = var.enable_ssh_engine ? 1 : 0

  path        = var.ssh_path
  type        = "ssh"
  description = "SSH secret engine for signed SSH certificates"
}
