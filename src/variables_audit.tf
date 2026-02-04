# =============================================================================
# AUDIT VARIABLES
# =============================================================================

variable "enable_file_audit" {
  description = "Enable file audit device"
  type        = bool
  default     = false
}

variable "audit_file_path" {
  description = "Path for audit log file"
  type        = string
  default     = "/var/log/vault/audit.log"
}

variable "audit_log_raw" {
  description = "Log raw request/response in audit"
  type        = string
  default     = "false"
}
