output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.k8s.name
}

output "host" {
  value = azurerm_kubernetes_cluster.k8s.kube_config[0].host
}

output "kubeconfig" {
  value = abspath("${path.root}/${local_sensitive_file.kubeconfig.filename}")
}
