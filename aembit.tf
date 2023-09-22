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
    "aembit_agent_proxy.pem" = base64decode("LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUNTRENDQWMyZ0F3SUJBZ0lFU3JqbFdEQUtCZ2dxaGtqT1BRUURBekJyTVNVd0l3WURWUVFEREJ4QlpXMWkKYVhRZ1ZHVnVZVzUwSURsaVptSXlOaUJTYjI5MElFTkJNUk13RVFZRFZRUUtEQXBCWlcxaWFYUWdTVzVqTVFzdwpDUVlEVlFRR0V3SlZVekVnTUI0R0NTcUdTSWIzRFFFSkFSWVJjM1Z3Y0c5eWRFQmhaVzFpYVhRdWFXOHdIaGNOCk1qTXdOekkzTVRRd05UUTJXaGNOTXpNd056STBNVFF3TlRRMldqQnJNU1V3SXdZRFZRUUREQnhCWlcxaWFYUWcKVkdWdVlXNTBJRGxpWm1JeU5pQlNiMjkwSUVOQk1STXdFUVlEVlFRS0RBcEJaVzFpYVhRZ1NXNWpNUXN3Q1FZRApWUVFHRXdKVlV6RWdNQjRHQ1NxR1NJYjNEUUVKQVJZUmMzVndjRzl5ZEVCaFpXMWlhWFF1YVc4d2RqQVFCZ2NxCmhrak9QUUlCQmdVcmdRUUFJZ05pQUFSWEFxSW1jSVdhbFRzUW1FeEhhRzl4TmZneUNFN01QK1MrdzFSY284aGwKczBNS2RjZ1NNMFhpVHBkdDVYSjIrKzB4cGMzQ3VTZ1NPclc0STlQdGt0d0dkMnc2eDljcDJMaGxOQzJnVWQ0aQpLdmgzK1d0Y3djN2VFR2lhdUkzRllTS2pRakJBTUE4R0ExVWRFd0VCL3dRRk1BTUJBZjh3RGdZRFZSMFBBUUgvCkJBUURBZ0VHTUIwR0ExVWREZ1FXQkJRcng0dnNRTEU2TThBODFmZlJrM3RwenpsSkx6QUtCZ2dxaGtqT1BRUUQKQXdOcEFEQm1BakVBbTZCSzRJYWRISVp1aTVQaGRjOEdLSnMrWHNqUHFKcHlFbklsQVJ0YUc1Z1EyOS9sN3EzMwo5WitRTjVvNHlKQXpBakVBMElMb0dkQ2pQYUpmekJCSkJJVGcrVmZtdGxaZUh0VktPVTlLbEFxcFBKRm13RVJ0CllCdVplWXBPNm8welI2NFIKLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=")
  }
}
