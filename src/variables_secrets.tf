# =============================================================================
# KV SECRET ENGINE VARIABLES
# =============================================================================

variable "enable_kv_engine" {
  description = "Enable KV v2 secret engine"
  type        = bool
  default     = true
}

variable "kv_path" {
  description = "Path for KV secret engine"
  type        = string
  default     = "secret"
}

# =============================================================================
# PKI SECRET ENGINE VARIABLES
# =============================================================================

variable "enable_pki_engine" {
  description = "Enable PKI secret engine"
  type        = bool
  default     = false
}

variable "pki_path" {
  description = "Path for PKI secret engine"
  type        = string
  default     = "pki"
}

variable "pki_default_lease_ttl" {
  description = "Default lease TTL for PKI certificates (in seconds)"
  type        = number
  default     = 3600
}

variable "pki_max_lease_ttl" {
  description = "Maximum lease TTL for PKI certificates (in seconds)"
  type        = number
  default     = 86400
}

variable "pki_generate_root" {
  description = "Generate a root CA certificate"
  type        = bool
  default     = false
}

variable "pki_root_common_name" {
  description = "Common name for root CA"
  type        = string
  default     = "Root CA"
}

variable "pki_root_ttl" {
  description = "TTL for root CA certificate"
  type        = string
  default     = "87600h"
}

variable "pki_key_type" {
  description = "Key type for PKI (rsa, ec, ed25519)"
  type        = string
  default     = "rsa"
}

variable "pki_key_bits" {
  description = "Key bits for PKI"
  type        = number
  default     = 4096
}

variable "pki_organization" {
  description = "Organization for PKI certificates"
  type        = string
  default     = ""
}

variable "pki_ou" {
  description = "Organizational Unit for PKI certificates"
  type        = string
  default     = ""
}

variable "pki_country" {
  description = "Country for PKI certificates"
  type        = string
  default     = ""
}

# =============================================================================
# DATABASE SECRET ENGINE VARIABLES
# =============================================================================

variable "enable_database_engine" {
  description = "Enable Database secret engine"
  type        = bool
  default     = false
}

variable "database_path" {
  description = "Path for Database secret engine"
  type        = string
  default     = "database"
}

# =============================================================================
# AWS SECRET ENGINE VARIABLES
# =============================================================================

variable "enable_aws_engine" {
  description = "Enable AWS secret engine"
  type        = bool
  default     = false
}

variable "aws_path" {
  description = "Path for AWS secret engine"
  type        = string
  default     = "aws"
}

variable "aws_access_key" {
  description = "AWS access key for secret engine"
  type        = string
  default     = ""
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS secret key for secret engine"
  type        = string
  default     = ""
  sensitive   = true
}

variable "aws_region" {
  description = "AWS region for secret engine"
  type        = string
  default     = "us-east-1"
}

variable "aws_default_lease_ttl" {
  description = "Default lease TTL for AWS credentials (in seconds)"
  type        = number
  default     = 3600
}

variable "aws_max_lease_ttl" {
  description = "Maximum lease TTL for AWS credentials (in seconds)"
  type        = number
  default     = 86400
}

# =============================================================================
# TRANSIT SECRET ENGINE VARIABLES
# =============================================================================

variable "enable_transit_engine" {
  description = "Enable Transit secret engine"
  type        = bool
  default     = false
}

variable "transit_path" {
  description = "Path for Transit secret engine"
  type        = string
  default     = "transit"
}

# =============================================================================
# SSH SECRET ENGINE VARIABLES
# =============================================================================

variable "enable_ssh_engine" {
  description = "Enable SSH secret engine"
  type        = bool
  default     = false
}

variable "ssh_path" {
  description = "Path for SSH secret engine"
  type        = string
  default     = "ssh"
}
