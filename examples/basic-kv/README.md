# Basic KV Secrets Engine Example

This example demonstrates how to create a basic KV version 2 secrets engine with a read policy.

## Usage

```bash
export VAULT_ADDR="http://localhost:8200"
export VAULT_TOKEN="your-vault-token"

tofu init
tofu plan
tofu apply
```

## What This Creates

- A KV v2 secret engine mounted at `secret/`
- A policy that allows reading secrets under `secret/data/app/`

## Testing

After applying, you can test by writing and reading a secret:

```bash
vault kv put secret/app/config username=admin password=secret
vault kv get secret/app/config
```
