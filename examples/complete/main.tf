module "vault_complete" {
  source = "../.."

  vault_address = var.vault_address
  vault_token   = var.vault_token

  secret_engines = {
    kv_v2 = {
      path                      = "secret"
      type                      = "kv-v2"
      description               = "KV v2 secrets engine"
      default_lease_ttl_seconds = 3600
      max_lease_ttl_seconds     = 86400
    }
    
    transit = {
      path        = "transit"
      type        = "transit"
      description = "Transit encryption engine"
    }
    
    pki = {
      path                      = "pki"
      type                      = "pki"
      description               = "PKI secrets engine"
      default_lease_ttl_seconds = 3600
      max_lease_ttl_seconds     = 87600
    }
  }

  auth_methods = {
    approle = {
      path               = "approle"
      type               = "approle"
      description        = "AppRole authentication"
      default_lease_ttl  = "1h"
      max_lease_ttl      = "24h"
      listing_visibility = "unauth"
    }
    
    userpass = {
      path               = "userpass"
      type               = "userpass"
      description        = "Username & Password authentication"
      default_lease_ttl  = "8h"
      max_lease_ttl      = "24h"
      listing_visibility = "hidden"
    }
  }

  policies = {
    admin_policy = {
      name = "admin-policy"
      policy = <<EOT
path "*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
EOT
    }
    
    developer_policy = {
      name = "developer-policy"
      policy = <<EOT
path "secret/data/dev/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "secret/metadata/dev/*" {
  capabilities = ["list", "read"]
}

path "transit/encrypt/app" {
  capabilities = ["update"]
}

path "transit/decrypt/app" {
  capabilities = ["update"]
}
EOT
    }
    
    app_policy = {
      name = "app-policy"
      policy = <<EOT
path "secret/data/app/*" {
  capabilities = ["read"]
}

path "transit/encrypt/app" {
  capabilities = ["update"]
}

path "transit/decrypt/app" {
  capabilities = ["update"]
}

path "auth/token/renew-self" {
  capabilities = ["update"]
}
EOT
    }
  }

  audit_devices = {
    file = {
      type = "file"
      path = "file"
      options = {
        file_path = "/vault/logs/audit.log"
      }
    }
  }
}

resource "vault_transit_secret_backend_key" "app_key" {
  backend = module.vault_complete.secret_engine_paths["transit"]
  name    = "app"
  
  deletion_allowed = true
  exportable       = false
  
  depends_on = [module.vault_complete]
}

resource "vault_approle_auth_backend_role" "app" {
  backend   = module.vault_complete.auth_method_paths["approle"]
  role_name = "app-role"
  
  token_policies = ["app-policy"]
  token_ttl      = 3600
  token_max_ttl  = 86400
  
  depends_on = [module.vault_complete]
}

resource "vault_generic_endpoint" "developer_user" {
  path                 = "auth/${module.vault_complete.auth_method_paths["userpass"]}/users/developer"
  ignore_absent_fields = true
  
  data_json = jsonencode({
    policies = ["developer-policy"]
    password = var.developer_password
  })
  
  depends_on = [module.vault_complete]
}
