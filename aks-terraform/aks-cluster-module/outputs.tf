# Output variable for AKS Cluster Name
output "aks_cluster_name" {
  description = "The name of the provisioned AKS cluster."
  value       = azurerm_kubernetes_cluster.aks_cluster.name
}

# Output variable for AKS Cluster ID
output "aks_cluster_id" {
  description = "The ID of the provisioned AKS cluster."
  value       = azurerm_kubernetes_cluster.aks_cluster.id
}

# Output variable for AKS KubeConfig
output "aks_kubeconfig" {
  description = "The Kubernetes configuration file for managing the AKS cluster."
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  sensitive   = true  # Marking this as sensitive to prevent exposing credentials
}



###################################
# # Output variable for AKS Cluster Name
# output "aks_cluster_name" {
#   description = "The name of the provisioned AKS cluster."
#   value       = azurerm_kubernetes_cluster.aks_cluster.name
# }

# # Output variable for AKS Cluster ID
# output "aks_cluster_id" {
#   description = "The ID of the provisioned AKS cluster."
#   value       = azurerm_kubernetes_cluster.aks_cluster.id
# }

# # Output variable for AKS KubeConfig
# output "aks_kubeconfig" {
#   description = "The Kubernetes configuration file for managing the AKS cluster."
#   value       = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
#   sensitive   = true  # Marking this as sensitive to prevent exposing credentials
# }
