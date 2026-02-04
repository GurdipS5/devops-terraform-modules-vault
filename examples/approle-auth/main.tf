module "vault_approle" {
  source = "../.."

  vault_address = var.vault_address
  vault_token   = var.vault_token

  auth_methods = {
    approle = {
      path               = "approle"
      type               = "approle"
      description        = "AppRole authentication for applications"
      default_lease_ttl  = "1h"
      max_lease_ttl      = "24h"
      listing_visibility = "unauth"
    }
  }

  secret_engines = {
    kv = {
      path        = "secret"
      type        = "kv-v2"
      description = "Application secrets"
    }
  }

  policies = {
    app_policy = {
      name = "app-policy"
      policy = <<EOT
path "secret/data/myapp/*" {
  capabilities = ["read", "list"]
}

path "auth/token/renew-self" {
  capabilities = ["update"]
}
EOT
    }
  }
}

resource "vault_approle_auth_backend_role" "app_role" {
  backend   = module.vault_approle.auth_method_paths["approle"]
  role_name = var.role_name

  token_policies = ["app-policy"]
  token_ttl      = 3600
  token_max_ttl  = 86400

  depends_on = [module.vault_approle]
}
