resource "helm_release" "aembit" {
  count            = var.aembit_tenant_id == null ? 0 : 1
  name             = "aembit"
  namespace        = "aembit"
  chart            = "aembit"
  create_namespace = true
  repository       = var.aembit_repo_url
  version          = var.aembit_version

  set {
    name  = "tenant"
    value = var.aembit_tenant_id
  }

  set {
    name  = "agentController.deviceCode"
    value = var.aembit_controller_device_code
  }
}

resource "kubernetes_config_map" "aembit_root_cert" {
  count = var.aembit_tenant_id == null ? 0 : 1
  metadata {
    name = "aembit-root-cert"
  }

  data = {
    "aembit_agent_proxy.pem" = base64decode(var.aembit_tenant_root_ca_cert)
  }
}
