resource "helm_release" "retool" {
  name              = "retool"
  chart             = "retool"
  repository        = "https://charts.retool.com"
  version           = "4.11.5"
  timeout           = 600
  wait              = false
  dependency_update = true

  values = [
    templatefile(
      "${path.module}/templates/retool_values.yaml",
      {
        license_key     = var.license_key
        encryption_key  = var.encryption_key
        jwt_secret      = var.jwt_secret
        scim_auth_token = var.scim_auth_token

        tags                    = "environment=${var.env}"
        allowed_cidr_blocks_str = "${join(",", var.allowed_cidr_blocks)}"
        public_subnet_ids_str   = "${join(",", var.public_subnet_ids)}"
        subdomain_cert_arn      = var.subdomain_cert_arn
        retool_dns_name         = local.retool_dns_name
        retool_image_repo       = var.retool_image_repo
        retool_image_version    = var.retool_image_version

        db_host = var.rds_cluster_endpoint
        db_port = var.rds_cluster_port
        db_user = var.rds_username
        db_pass = var.rds_password
        db_name = "retool"

        okta_enable                               = var.okta_enable
        okta_url                                  = "${var.okta_url}"
        okta_to_retool_role_mapping               = "${var.okta_to_retool_role_mapping}"
        retool_okta_app_client_id                 = "${var.retool_okta_app_client_id}"
        retool_okta_app_client_secret             = "${var.retool_okta_app_client_secret}"

        github_enable                             = var.github_enable
        retool_github_app_id                      = try(length(var.github_app_id), 0) > 0 ? var.github_app_id : ""
        retool_github_app_installation_id         = try(length(var.github_app_installation_id), 0) > 0 ? var.github_app_installation_id : ""
        retool_github_app_b64_encoded_private_key = try(length(var.github_app_b64_encoded_private_key), 0) > 0 ? var.github_app_b64_encoded_private_key : ""

        aembit_tenant_id = var.aembit_tenant_id == null ? "" : var.aembit_tenant_id
      }
    )
  ]

  depends_on = [
    helm_release.aembit,
    kubernetes_config_map.aembit_root_cert
  ]
}
