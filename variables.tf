variable "vault_address" {
  description = "The address of the Vault server"
  type        = string
}

variable "vault_token" {
  description = "The Vault authentication token"
  type        = string
  default     = null
  sensitive   = true
}

variable "vault_namespace" {
  description = "The Vault namespace to use"
  type        = string
  default     = null
}

variable "secret_engines" {
  description = "Map of secret engines to create"
  type = map(object({
    path                      = string
    type                      = string
    description               = optional(string)
    options                   = optional(map(string))
    default_lease_ttl_seconds = optional(number)
    max_lease_ttl_seconds     = optional(number)
  }))
  default = {}
}

variable "auth_methods" {
  description = "Map of authentication methods to configure"
  type = map(object({
    path                = string
    type                = string
    description         = optional(string)
    default_lease_ttl   = optional(string, "1h")
    max_lease_ttl       = optional(string, "24h")
    listing_visibility  = optional(string, "unauth")
  }))
  default = {}
}

variable "policies" {
  description = "Map of policies to create"
  type = map(object({
    name   = string
    policy = string
  }))
  default = {}
}

variable "audit_devices" {
  description = "Map of audit devices to enable"
  type = map(object({
    type    = string
    path    = optional(string)
    options = optional(map(string), {})
  }))
  default = {}
}
