# =============================================================================
# GENERAL VARIABLES
# =============================================================================

variable "enable_namespaces" {
  description = "Enable Vault namespaces (Enterprise only)"
  type        = bool
  default     = false
}

variable "namespaces" {
  description = "List of namespaces to create (Enterprise only)"
  type        = list(string)
  default     = []
}
