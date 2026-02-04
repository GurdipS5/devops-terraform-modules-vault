# 🔐 devops-terraform-modules-vault

[![OpenTofu](https://img.shields.io/badge/OpenTofu-1.6+-844FBA?style=flat-square&logo=opentofu&logoColor=white)](https://opentofu.org/)
[![Terraform](https://img.shields.io/badge/Terraform-1.0+-7B42BC?style=flat-square&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Vault](https://img.shields.io/badge/Vault-1.12+-000000?style=flat-square&logo=vault&logoColor=white)](https://www.vaultproject.io/)
[![Buildkite](https://img.shields.io/badge/Buildkite-CI-00C853?style=flat-square&logo=buildkite&logoColor=white)](https://buildkite.com/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square)](LICENSE)
[![Pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?style=flat-square&logo=pre-commit)](https://github.com/pre-commit/pre-commit)

A comprehensive Terraform/OpenTofu module for managing HashiCorp Vault infrastructure and configuration.

## 📋 Table of Contents

- [Features](#-features)
- [Prerequisites](#-prerequisites)
- [Usage](#-usage)
- [Examples](#-examples)
- [Requirements](#-requirements)
- [Providers](#-providers)
- [Inputs](#-inputs)
- [Outputs](#-outputs)
- [Testing](#-testing)
- [Contributing](#-contributing)
- [Security](#-security)
- [License](#-license)

## ✨ Features

- 🔒 Secure Vault configuration management
- 🔑 Secret engine management (KV, Database, PKI, etc.)
- 👥 Authentication method configuration
- 📜 Policy management
- 🔐 Encryption as a Service (Transit)
- 🌐 Multi-namespace support
- 🔄 Automated secret rotation
- 📊 Audit logging configuration

## 🛠️ Prerequisites

- [OpenTofu](https://opentofu.org/) >= 1.6 or [Terraform](https://www.terraform.io/) >= 1.0
- [HashiCorp Vault](https://www.vaultproject.io/) >= 1.12
- Valid Vault authentication credentials
- Appropriate Vault permissions for resource creation

## 🚀 Usage

### Basic Example

```hcl
module "vault" {
  source = "github.com/your-org/devops-terraform-modules-vault?ref=v1.0.0"

  vault_address = "https://vault.example.com"
  vault_token   = var.vault_token

  secret_engines = {
    kv = {
      path        = "secret"
      type        = "kv-v2"
      description = "KV Version 2 secret engine"
    }
  }

  auth_methods = {
    approle = {
      path        = "approle"
      type        = "approle"
      description = "AppRole authentication"
    }
  }

  policies = {
    app_policy = {
      name   = "app-policy"
      policy = file("${path.module}/policies/app-policy.hcl")
    }
  }
}
```

## 📚 Examples

Detailed examples can be found in the [examples](./examples) directory:

- [**Basic KV Secrets Engine**](./examples/basic-kv) - Simple KV v2 secrets engine setup
- [**Database Secrets Engine**](./examples/database-secrets) - Dynamic database credentials
- [**PKI Secrets Engine**](./examples/pki) - Certificate authority and certificate management
- [**AppRole Authentication**](./examples/approle-auth) - AppRole authentication configuration
- [**Transit Encryption**](./examples/transit) - Encryption as a service
- [**Complete Setup**](./examples/complete) - Full Vault configuration example

## 📦 Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| vault | >= 3.20 |

## 🔌 Providers

| Name | Version |
|------|---------|
| vault | >= 3.20 |

## 📥 Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vault_address | The address of the Vault server | `string` | n/a | yes |
| vault_token | The Vault authentication token | `string` | `null` | no |
| vault_namespace | The Vault namespace to use | `string` | `null` | no |
| secret_engines | Map of secret engines to create | `map(object)` | `{}` | no |
| auth_methods | Map of authentication methods to configure | `map(object)` | `{}` | no |
| policies | Map of policies to create | `map(object)` | `{}` | no |
| audit_devices | Map of audit devices to enable | `map(object)` | `{}` | no |

## 📤 Outputs

| Name | Description |
|------|-------------|
| secret_engine_paths | Map of created secret engine paths |
| auth_method_paths | Map of configured authentication method paths |
| policy_names | List of created policy names |

## 🧪 Testing

This module includes comprehensive tests using OpenTofu/Terraform native testing framework.

### Running Tests

```bash
tofu test
```

or

```bash
terraform test
```

### Test Structure

Tests are located in the [tests](./tests) directory:

- `basic.tftest.hcl` - Basic functionality tests
- `secret_engines.tftest.hcl` - Secret engine tests
- `auth_methods.tftest.hcl` - Authentication method tests
- `policies.tftest.hcl` - Policy configuration tests

## 🤝 Contributing

Contributions are welcome! Please follow these guidelines:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Code Quality

This project uses several tools to maintain code quality:

- **lefthook** - Git hooks for pre-commit checks
- **tflint** - Terraform linting
- **tfsec** - Security scanning
- **checkov** - Policy as code validation
- **semgrep** - Static analysis
- **terraform-docs** - Documentation generation

Run pre-commit hooks manually:

```bash
lefthook run pre-commit
```

## 🔒 Security

- Never commit sensitive information (tokens, passwords, private keys)
- Use Vault's dynamic secrets whenever possible
- Follow the principle of least privilege for policies
- Regularly rotate credentials
- Enable audit logging in production environments

### Reporting Security Issues

Please report security vulnerabilities to security@example.com

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Maintainers

- Platform Team - [@platform-team](https://github.com/platform-team)
- Security Team - [@security-team](https://github.com/security-team)

## 🔗 Related Resources

- [HashiCorp Vault Documentation](https://www.vaultproject.io/docs)
- [Terraform Vault Provider](https://registry.terraform.io/providers/hashicorp/vault/latest/docs)
- [OpenTofu Documentation](https://opentofu.org/docs/)

---

Made with ❤️ by the Platform Team
