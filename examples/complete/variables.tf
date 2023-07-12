# Required
variable "license_key" {
  description = "Enterprise License Key."
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet ids for the loadbalancer."
  type        = list(string)
}

variable "allowed_cidr_blocks" {
  description = "IP CIDR blocks to allow to connect to the loadbalancer. Use `0.0.0.0/0` for public."
  type        = list(string)
}

variable "env" {
  description = "Environment name."
  type        = string
}

variable "encryption_key" {
  description = "Key used to encrypt the Retool database."
  type        = string
}

variable "jwt_secret" {
  description = "Secret used to sign authentication requests from Retool server."
  type        = string
}

variable "hosted_zone_subdomain" {
  description = "Hosted zone subdomain or DNS Subdomain."
  type        = string
}

variable "subdomain_cert_arn" {
  description = "ACM Cert ARN of the wildcart cert for the hosted zone domain name."
  type        = string
}

variable "rds_cluster_endpoint" {
  description = "RDS cluster endpoint."
  type        = string
}

variable "rds_cluster_port" {
  description = "RDS port to connect services to."
  type        = string
}

variable "rds_username" {
  description = "RDS username for AuthN."
  type        = string
}
variable "rds_password" {
  description = "RDS password for AuthN."
  type        = string
}

variable "retool_image_repo" {
  description = "Docker Hub container image repo name."
  type        = string
}

variable "retool_image_version" {
  description = "Retool image version."
  type        = string
}


# Optional
variable "app_name" {
  description = "Name of the app."
  type        = string
  default     = "retool"
}

variable "domain_name_suffix" {
  description = "Retool DNS name suffix."
  type        = string
  default     = null
}


## Okta Integration
variable "okta_enable" {
  description = "Enable Okta SSO integration"
  type        = bool
  default     = false
}

variable "scim_auth_token" {
  description = "Retool API token to allow SSO provider to provision and manage users/groups in Retool."
  type        = string
  default     = null
  sensitive   = true
}

variable "retool_okta_app_client_id" {
  description = "Okta app client id. Variable `okta_enable` need to be `true`."
  type        = string
  default     = null
}

variable "retool_okta_app_client_secret" {
  description = "Okta app client secret. Variable `okta_enable` need to be `true`."
  type        = string
  default     = null
  sensitive   = true
}

variable "okta_url" {
  description = "Okta URL. Variable `okta_enable` need to be `true`."
  type        = string
  default     = null
}

variable "okta_to_retool_role_mapping" {
  description = "Comma separated Okta to Retool groups mapping. Example: `retool-group-1 -> retool-group-1, okta-group-2 -> retool-group-2`. Variable `okta_enable` need to be `true`."
  type        = string
  default     = null
}


## GitHub Integration
variable "github_enable" {
  description = "Enable GitHub source control integration"
  type        = bool
  default     = false
}

variable "github_app_id" {
  description = "Github App ID. Variable `github_enable` need to be `true`."
  type        = string
  default     = null
}

variable "github_app_installation_id" {
  description = "Github App's installation ID. Variable `github_enable` need to be `true`."
  type        = string
  default     = null
}

variable "github_app_b64_encoded_private_key" {
  description = "Github App's base64 encoded private key. Variable `github_enable` need to be `true`."
  type        = string
  default     = null
  sensitive   = true
}
