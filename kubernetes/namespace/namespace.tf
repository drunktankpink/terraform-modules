resource "null_resource" "this" {
  triggers = {
    instance = join(",", var.dependencies)
  }
}

resource "kubernetes_namespace" "this" {
  count      = var.create_resources ? 1 : 0
  depends_on = [null_resource.this]

  metadata {
    name        = var.name
    labels      = var.labels
    annotations = var.annotations
  }
}