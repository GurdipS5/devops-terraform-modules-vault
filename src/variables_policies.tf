# =============================================================================
# POLICY VARIABLES
# =============================================================================

variable "create_admin_policy" {
  description = "Create an admin policy"
  type        = bool
  default     = true
}

variable "admin_policy_name" {
  description = "Name for the admin policy"
  type        = string
  default     = "admin"
}

variable "create_readonly_policy" {
  description = "Create a read-only policy"
  type        = bool
  default     = true
}

variable "readonly_policy_name" {
  description = "Name for the read-only policy"
  type        = string
  default     = "readonly"
}

variable "application_policies" {
  description = "Map of application policy names to policy HCL"
  type        = map(string)
  default     = {}
}
