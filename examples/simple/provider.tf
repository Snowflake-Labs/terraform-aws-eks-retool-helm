data "aws_eks_cluster_auth" "example_eks_cluster" {
  name = "EKS CLUSTER ID"
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.example_eks_cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.example_eks_cluster.certificate_authority.0.data)

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.example_eks_cluster.name]
      command     = "aws"
    }
  }
}
