variables {
  vault_address = "http://127.0.0.1:8200"
  vault_token   = "root"
}

run "create_auth_methods" {
  command = plan

  variables {
    auth_methods = {
      approle = {
        path        = "approle"
        type        = "approle"
        description = "AppRole authentication"
      }
    }
  }

  assert {
    condition     = length(vault_auth_backend.auth_method) == 1
    error_message = "Should create one auth method"
  }
}
