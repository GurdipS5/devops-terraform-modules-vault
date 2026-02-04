# =============================================================================
# POLICIES
# =============================================================================

# Admin Policy
resource "vault_policy" "admin" {
  count = var.create_admin_policy ? 1 : 0

  name   = var.admin_policy_name
  policy = <<-EOT
    # Full admin access
    path "*" {
      capabilities = ["create", "read", "update", "delete", "list", "sudo"]
    }
  EOT
}

# Read-Only Policy
resource "vault_policy" "readonly" {
  count = var.create_readonly_policy ? 1 : 0

  name   = var.readonly_policy_name
  policy = <<-EOT
    # Read-only access to all secrets
    path "secret/*" {
      capabilities = ["read", "list"]
    }

    path "${var.kv_path}/*" {
      capabilities = ["read", "list"]
    }

    path "auth/token/lookup-self" {
      capabilities = ["read"]
    }
  EOT
}

# Application Policy Template
resource "vault_policy" "application" {
  for_each = var.application_policies

  name   = each.key
  policy = each.value
}
