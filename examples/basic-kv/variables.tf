variable "vault_address" {
  description = "The address of the Vault server"
  type        = string
  default     = "http://localhost:8200"
}

variable "vault_token" {
  description = "The Vault authentication token"
  type        = string
  sensitive   = true
}
