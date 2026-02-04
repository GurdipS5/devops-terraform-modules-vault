module "vault_kv" {
  source = "../.."

  vault_address = var.vault_address
  vault_token   = var.vault_token

  secret_engines = {
    kv_v2 = {
      path        = "secret"
      type        = "kv-v2"
      description = "KV Version 2 secret engine for application secrets"
      options = {
        version = "2"
      }
    }
  }

  policies = {
    app_read = {
      name = "app-read-policy"
      policy = <<EOT
path "secret/data/app/*" {
  capabilities = ["read", "list"]
}
EOT
    }
  }
}
