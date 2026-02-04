variables {
  vault_address = "http://127.0.0.1:8200"
  vault_token   = "root"
}

run "create_policies" {
  command = plan

  variables {
    policies = {
      read_policy = {
        name = "read-only"
        policy = "path \"secret/data/*\" { capabilities = [\"read\"] }"
      }
    }
  }

  assert {
    condition     = length(vault_policy.policy) == 1
    error_message = "Should create one policy"
  }
}
