terraform {
  required_version = ">= 1.0"
  
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = ">= 3.20"
    }
  }
}

resource "vault_mount" "secret_engine" {
  for_each = var.secret_engines

  path        = each.value.path
  type        = each.value.type
  description = lookup(each.value, "description", null)
  
  options = lookup(each.value, "options", null)
  
  default_lease_ttl_seconds = lookup(each.value, "default_lease_ttl_seconds", null)
  max_lease_ttl_seconds     = lookup(each.value, "max_lease_ttl_seconds", null)
}

resource "vault_auth_backend" "auth_method" {
  for_each = var.auth_methods

  path        = each.value.path
  type        = each.value.type
  description = lookup(each.value, "description", null)
  
  tune {
    default_lease_ttl  = lookup(each.value, "default_lease_ttl", "1h")
    max_lease_ttl      = lookup(each.value, "max_lease_ttl", "24h")
    listing_visibility = lookup(each.value, "listing_visibility", "unauth")
  }
}

resource "vault_policy" "policy" {
  for_each = var.policies

  name   = each.value.name
  policy = each.value.policy
}

resource "vault_audit" "audit_device" {
  for_each = var.audit_devices

  type = each.value.type
  path = lookup(each.value, "path", each.key)
  
  options = lookup(each.value, "options", {})
}
