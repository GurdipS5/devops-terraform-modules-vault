# =============================================================================
# NAMESPACE (Enterprise Only)
# =============================================================================

resource "vault_namespace" "namespaces" {
  for_each = var.enable_namespaces ? toset(var.namespaces) : toset([])

  path = each.value
}
