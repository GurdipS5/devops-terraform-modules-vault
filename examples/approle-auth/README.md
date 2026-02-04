# AppRole Authentication Example

This example demonstrates how to configure AppRole authentication for application-based authentication with Vault.

## Overview

AppRole is designed for machine authentication. Applications authenticate to Vault using a Role ID and Secret ID pair.

## Usage

```bash
export VAULT_ADDR="http://localhost:8200"
export VAULT_TOKEN="your-vault-token"

tofu init
tofu plan
tofu apply
```

## What This Creates

- AppRole authentication method mounted at `approle/`
- A KV v2 secret engine for storing application secrets
- A policy allowing read access to secrets under `secret/data/myapp/`
- An AppRole with the policy attached

## Retrieving Credentials

After applying, retrieve the Role ID and Secret ID:

```bash
vault read auth/approle/role/my-app-role/role-id
vault write -f auth/approle/role/my-app-role/secret-id
```

## Testing Authentication

Use the Role ID and Secret ID to authenticate:

```bash
vault write auth/approle/login role_id="<role-id>" secret_id="<secret-id>"
```

This will return a client token that can be used for subsequent API calls.
