provider "kubernetes" {
  config_path = pathexpand(var.kube_config)
}

resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.namespace
  }
}