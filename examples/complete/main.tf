module "retool" {
  source = "../../"

  license_key     = var.license_key
  encryption_key  = var.encryption_key
  jwt_secret      = var.jwt_secret
  scim_auth_token = var.scim_auth_token

  rds_cluster_endpoint = var.rds_cluster_endpoint
  rds_cluster_port     = var.rds_cluster_port
  rds_username         = var.rds_username
  rds_password         = var.rds_password

  env           = var.env
  app_name      = var.app_name

  allowed_cidr_blocks = var.allowed_cidr_blocks
  public_subnet_ids   = var.public_subnet_ids

  subdomain_cert_arn    = var.subdomain_cert_arn
  hosted_zone_subdomain = var.hosted_zone_subdomain
  domain_name_suffix    = var.domain_name_suffix

  retool_image_repo    = var.retool_image_repo
  retool_image_version = var.retool_image_version

  okta_enable                   = var.okta_enable
  okta_url                      = var.okta_url
  okta_to_retool_role_mapping   = var.okta_to_retool_role_mapping
  retool_okta_app_client_id     = var.retool_okta_app_client_id
  retool_okta_app_client_secret = var.retool_okta_app_client_secret

  github_enable                      = var.github_enable
  github_app_id                      = var.github_app_id 
  github_app_installation_id         = var.github_app_installation_id
  github_app_b64_encoded_private_key = var.github_app_b64_encoded_private_key
}
