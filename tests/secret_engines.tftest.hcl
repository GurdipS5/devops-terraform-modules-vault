variables {
  vault_address = "http://127.0.0.1:8200"
  vault_token   = "root"
}

run "create_multiple_secret_engines" {
  command = plan

  variables {
    secret_engines = {
      kv = {
        path        = "secret"
        type        = "kv-v2"
        description = "KV v2 engine"
      }
      transit = {
        path        = "transit"
        type        = "transit"
        description = "Transit encryption"
      }
    }
  }

  assert {
    condition     = length(vault_mount.secret_engine) == 2
    error_message = "Should create two secret engines"
  }
}
