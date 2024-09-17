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


# Optional
variable "retool_image_repo" {
  description = "Docker Hub container image repo name."
  type        = string
  default     = "https://charts.retool.com"
}

variable "retool_image_version" {
  description = "Retool image version."
  type        = string
  default     = "4.11.5"
}

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

variable "retool_replica_count" {
  description = "Retool container replica count."
  type        = number
  default     = 1
}


# Aembit Proxy
variable "aembit_tenant_id" {
  description = "Aembit tenant id."
  type        = string
  default     = null
}

variable "aembit_tenant_root_ca_cert" {
  description = "Aembit tenant root CA certificate in base64 format."
  type        = string
  default     = null
}

variable "aembit_controller_device_code" {
  description = "Aembit agent controller device code. Required when aembit_tenant_id variable is not null."
  type        = string
  default     = null
}

variable "aembit_repo_url" {
  description = "Aembit helm chart repository url. Required when aembit_tenant_id variable is not null."
  type        = string
  default     = "https://helm.aembit.io"
}

variable "aembit_version" {
  description = "Aembit helm chart version. Required when aembit_tenant_id variable is not null."
  type        = string
  default     = null
}

variable "aembit_enable_proxy" {
  description = "Enable routing traffic from Retool to Aembit Proxy"
  type        = bool
  default     = true
}

variable "aembit_proxy_container_limits" {
  description = "Aembit Agent Proxy container cpu and memory limit."
  type        = map(string)
  default     = {
    cpu_limit      = "500m"
    cpu_request    = "250m"
    memory_limit   = "250Mi"
    memory_request = "100Mi"
  }
}

variable "aembit_proxy_environment_variables" {
  description = "Aembit Agent Proxy environment variables."
  type        = map(string)
  default     = {
    AEMBIT_HTTP_IDLE_TIMEOUT_SEC = "3600"
  }
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


locals {
  retool_dns_name = var.domain_name_suffix != null ? "${var.app_name}-${var.domain_name_suffix}.${var.hosted_zone_subdomain}" : "${var.app_name}.${var.hosted_zone_subdomain}"
}
