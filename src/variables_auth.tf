# =============================================================================
# APPROLE AUTH VARIABLES
# =============================================================================

variable "enable_approle_auth" {
  description = "Enable AppRole authentication method"
  type        = bool
  default     = true
}

variable "approle_path" {
  description = "Path for AppRole auth method"
  type        = string
  default     = "approle"
}

variable "approle_default_lease_ttl" {
  description = "Default lease TTL for AppRole tokens"
  type        = string
  default     = "1h"
}

variable "approle_max_lease_ttl" {
  description = "Maximum lease TTL for AppRole tokens"
  type        = string
  default     = "24h"
}

# =============================================================================
# KUBERNETES AUTH VARIABLES
# =============================================================================

variable "enable_kubernetes_auth" {
  description = "Enable Kubernetes authentication method"
  type        = bool
  default     = false
}

variable "kubernetes_auth_path" {
  description = "Path for Kubernetes auth method"
  type        = string
  default     = "kubernetes"
}

variable "kubernetes_host" {
  description = "Kubernetes API server URL"
  type        = string
  default     = ""
}

variable "kubernetes_ca_cert" {
  description = "Kubernetes CA certificate"
  type        = string
  default     = ""
  sensitive   = true
}

variable "kubernetes_token_reviewer_jwt" {
  description = "JWT token for the token reviewer"
  type        = string
  default     = ""
  sensitive   = true
}

variable "kubernetes_disable_iss_validation" {
  description = "Disable JWT issuer validation"
  type        = bool
  default     = false
}

variable "kubernetes_default_lease_ttl" {
  description = "Default lease TTL for Kubernetes tokens"
  type        = string
  default     = "1h"
}

variable "kubernetes_max_lease_ttl" {
  description = "Maximum lease TTL for Kubernetes tokens"
  type        = string
  default     = "24h"
}

# =============================================================================
# USERPASS AUTH VARIABLES
# =============================================================================

variable "enable_userpass_auth" {
  description = "Enable Userpass authentication method"
  type        = bool
  default     = false
}

variable "userpass_path" {
  description = "Path for Userpass auth method"
  type        = string
  default     = "userpass"
}

variable "userpass_default_lease_ttl" {
  description = "Default lease TTL for Userpass tokens"
  type        = string
  default     = "1h"
}

variable "userpass_max_lease_ttl" {
  description = "Maximum lease TTL for Userpass tokens"
  type        = string
  default     = "24h"
}

# =============================================================================
# LDAP AUTH VARIABLES
# =============================================================================

variable "enable_ldap_auth" {
  description = "Enable LDAP authentication method"
  type        = bool
  default     = false
}

variable "ldap_path" {
  description = "Path for LDAP auth method"
  type        = string
  default     = "ldap"
}

variable "ldap_url" {
  description = "LDAP server URL"
  type        = string
  default     = ""
}

variable "ldap_userdn" {
  description = "LDAP user DN"
  type        = string
  default     = ""
}

variable "ldap_userattr" {
  description = "LDAP user attribute"
  type        = string
  default     = "cn"
}

variable "ldap_groupdn" {
  description = "LDAP group DN"
  type        = string
  default     = ""
}

variable "ldap_groupfilter" {
  description = "LDAP group filter"
  type        = string
  default     = ""
}

variable "ldap_groupattr" {
  description = "LDAP group attribute"
  type        = string
  default     = "cn"
}

variable "ldap_binddn" {
  description = "LDAP bind DN"
  type        = string
  default     = ""
}

variable "ldap_bindpass" {
  description = "LDAP bind password"
  type        = string
  default     = ""
  sensitive   = true
}

variable "ldap_insecure_tls" {
  description = "Skip TLS verification for LDAP"
  type        = bool
  default     = false
}

variable "ldap_starttls" {
  description = "Use STARTTLS for LDAP connection"
  type        = bool
  default     = false
}

# =============================================================================
# OIDC AUTH VARIABLES
# =============================================================================

variable "enable_oidc_auth" {
  description = "Enable OIDC authentication method"
  type        = bool
  default     = false
}

variable "oidc_path" {
  description = "Path for OIDC auth method"
  type        = string
  default     = "oidc"
}

variable "oidc_discovery_url" {
  description = "OIDC discovery URL"
  type        = string
  default     = ""
}

variable "oidc_client_id" {
  description = "OIDC client ID"
  type        = string
  default     = ""
}

variable "oidc_client_secret" {
  description = "OIDC client secret"
  type        = string
  default     = ""
  sensitive   = true
}

variable "oidc_default_role" {
  description = "Default OIDC role"
  type        = string
  default     = ""
}

variable "oidc_default_lease_ttl" {
  description = "Default lease TTL for OIDC tokens"
  type        = string
  default     = "1h"
}

variable "oidc_max_lease_ttl" {
  description = "Maximum lease TTL for OIDC tokens"
  type        = string
  default     = "24h"
}
