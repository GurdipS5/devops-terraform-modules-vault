# HashiCorp Vault Terraform Module
# This module configures Vault authentication methods, secret engines, and policies

terraform {
  required_version = ">= 1.0.0"

  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = ">= 3.0.0"
    }
  }
}
