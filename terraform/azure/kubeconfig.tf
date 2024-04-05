resource "local_sensitive_file" "kubeconfig" {
  content = azurerm_kubernetes_cluster.k8s.kube_config_raw
  filename = "./kubeconfig-todo"
}
