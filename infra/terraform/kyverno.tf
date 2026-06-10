resource "helm_release" "kyverno" {
  name             = "kyverno"
  repository       = "https://kyverno.github.io/kyverno/"
  chart            = "kyverno"
  namespace        = "kyverno"
  create_namespace = true

  set = [
    {
      name  = "admissionController.replicas"
      value = "2"
    },
    {
      name  = "backgroundController.replicas"
      value = "2"
    },
    {
      name  = "cleanupController.replicas"
      value = "2"
    },
    {
      name  = "reportsController.replicas"
      value = "2"
    }
  ]

  depends_on = [
    aws_eks_node_group.main
  ]
}
