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

  # Aembit Agent Proxy container cpu and memory limits
  set {
    name  = "agentProxy.cpuRequest"
    value = var.aembit_proxy_container_limits["cpu_request"]
  }

  set {
    name  = "agentProxy.cpuLimit"
    value = var.aembit_proxy_container_limits["cpu_limit"]
  }

  set {
    name  = "agentProxy.memRequest"
    value = var.aembit_proxy_container_limits["memory_request"]
  }

  set {
    name  = "agentProxy.memLimit"
    value = var.aembit_proxy_container_limits["memory_limit"]
  }

  # Set Aembit Proxy timeout for idle opened connections
  set {
    name  = "agentProxy.env.AEMBIT_HTTP_IDLE_TIMEOUT_SEC"
    value = var.aembit_proxy_environment_variables["AEMBIT_HTTP_IDLE_TIMEOUT_SEC"]
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
