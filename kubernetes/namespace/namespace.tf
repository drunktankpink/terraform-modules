provider "kubernetes" {
  config_path = pathexpand(var.kube_config)
}

resource "kubernetes_namespace" "this" {
  metadata {
    name = var.namespace
  }
}