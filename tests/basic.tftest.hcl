variables {
  vault_address = "http://127.0.0.1:8200"
  vault_token   = "root"
}

run "setup_basic_vault" {
  command = plan

  variables {
    secret_engines = {
      test_kv = {
        path        = "test-secret"
        type        = "kv-v2"
        description = "Test KV engine"
      }
    }

    policies = {
      test_policy = {
        name = "test-policy"
        policy = <<EOT
path "test-secret/data/*" {
  capabilities = ["read", "list"]
}
EOT
      }
    }
  }

  assert {
    condition     = length(vault_mount.secret_engine) == 1
    error_message = "Should create exactly one secret engine"
  }

  assert {
    condition     = vault_mount.secret_engine["test_kv"].path == "test-secret"
    error_message = "Secret engine path should be 'test-secret'"
  }
}
