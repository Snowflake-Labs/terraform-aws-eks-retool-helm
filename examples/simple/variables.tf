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
