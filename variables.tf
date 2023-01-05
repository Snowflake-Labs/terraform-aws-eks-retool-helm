# Required
variable "license_key" {
  type        = string
  description = "Enterprise License Key."
}

variable "public_subnet_ids" {
  description = ""
  type        = list(string)
}

variable "private_subnet_ids" {
  description = ""
  type        = list(string)
}

variable "allowed_cidr_blocks" {
  description = ""
  type        = list(string)
}

variable "env" {
  description = ""
  type        = string
}

variable "encryption_key" {
  description = ""
  type        = string
}

variable "jwt_secret" {
  description = ""
  type        = string
}

variable "scim_auth_token" {
  description = ""
  type        = string
}

variable "module_prefix" {
  description = ""
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

variable "retool_okta_app_client_id" {
  type = string
}

variable "retool_okta_app_client_secret" {
  type = string
}

variable "okta_url" {
  type = string
}

variable "okta_to_retool_role_mapping" {
  type = string
}

variable "retool_image_repo" {
  type = string
}

variable "retool_image_version" {
  type = string
}

# Optional
variable "app_name" {
  description = "Name of the app."
  type        = string
  default     = "retool"
}

variable "domain_name_suffix" {
  description = "Prefix for domain name."
  type        = string
  default     = null
}

variable "github_app_id" {
  description = "Github App ID."
  type        = string
  default     = null
}

variable "github_app_installation_id" {
  description = "Github App's installation ID."
  type        = string
  default     = null
}

variable "github_app_b64_encoded_private_key" {
  description = "Github App's base64 encoded private key."
  type        = string
  default     = null
  sensitive   = true
}

locals {
  retool_prefix    = "${var.module_prefix}-${var.app_name}"
  eks_cluster_name = "${var.module_prefix}-${var.app_name}-cluster"
}

locals {
  retool_dns_name = var.domain_name_suffix != null ? "${var.app_name}-${var.domain_name_suffix}.${var.hosted_zone_subdomain}" : "${var.app_name}.${var.hosted_zone_subdomain}"
}
