module "retool" {
  source = "../../"

  license_key     = var.license_key
  encryption_key  = var.encryption_key
  jwt_secret      = var.jwt_secret

  rds_cluster_endpoint = var.rds_cluster_endpoint
  rds_cluster_port     = var.rds_cluster_port
  rds_username         = var.rds_username
  rds_password         = var.rds_password

  env           = var.env

  allowed_cidr_blocks = var.allowed_cidr_blocks
  public_subnet_ids   = var.public_subnet_ids

  subdomain_cert_arn    = var.subdomain_cert_arn
  hosted_zone_subdomain = var.hosted_zone_subdomain
}
