# Complete Vault Setup Example

This example demonstrates a complete Vault setup with multiple secret engines, authentication methods, policies, and audit logging.

## Overview

This configuration creates:
- Multiple secret engines (KV v2, Transit, PKI)
- Multiple authentication methods (AppRole, Userpass)
- Multiple policies with different permission levels
- File-based audit logging
- Transit encryption key for application use
- AppRole configuration for machine authentication
- User authentication setup

## Usage

```bash
export VAULT_ADDR="http://localhost:8200"
export VAULT_TOKEN="your-root-token"
export TF_VAR_developer_password="secure-password"

tofu init
tofu plan
tofu apply
```

## What This Creates

### Secret Engines
- **KV v2** (`secret/`) - Key-value secrets storage
- **Transit** (`transit/`) - Encryption as a service
- **PKI** (`pki/`) - Certificate authority

### Authentication Methods
- **AppRole** (`approle/`) - For applications
- **Userpass** (`userpass/`) - For human users

### Policies
- **admin-policy** - Full access to all paths
- **developer-policy** - Access to dev secrets and transit encryption
- **app-policy** - Read-only access to app secrets and transit encryption

### Additional Resources
- Transit encryption key named `app`
- AppRole named `app-role` with app-policy
- Userpass user `developer` with developer-policy
- File audit device logging to `/vault/logs/audit.log`

## Testing

### Test Userpass Authentication
```bash
vault login -method=userpass username=developer password=<your-password>
vault kv put secret/dev/config key=value
```

### Test AppRole Authentication
```bash
ROLE_ID=$(vault read -field=role_id auth/approle/role/app-role/role-id)
SECRET_ID=$(vault write -field=secret_id -f auth/approle/role/app-role/secret-id)
vault write auth/approle/login role_id="$ROLE_ID" secret_id="$SECRET_ID"
```

### Test Transit Encryption
```bash
echo -n "my secret data" | base64 | vault write transit/encrypt/app plaintext=-
vault write transit/decrypt/app ciphertext=<ciphertext-from-above>
```

## Security Considerations

- Change the developer password to a secure value
- In production, use more restrictive policies
- Enable additional audit devices for redundancy
- Rotate AppRole secret IDs regularly
- Use namespace isolation for multi-tenancy
