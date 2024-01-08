# AKS Cluster Resource
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_cluster_name
  location            = var.cluster_location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

#   default_node_pool {
#     name                = "default"
#     node_count          = 3  
#     vm_size             = "Standard_DS2_v2"  
#     vnet_subnet_id      = var.worker_node_subnet_id
#   }

  default_node_pool {
    name                = "default"
    node_count          = 1  # Minimize the number of nodes
    vm_size             = "Standard_B2s"  
    vnet_subnet_id      = var.worker_node_subnet_id
    enable_auto_scaling = true  # Enable auto-scaling
    min_count           = 1
    max_count           = 2
  }
  service_principal {
    client_id     = var.service_principal_client_id
    client_secret = var.service_principal_secret
  }

  network_profile {
    network_plugin     = "azure"
    network_policy     = "calico"
    dns_service_ip     = "10.1.0.10"  # 
    #docker_bridge_cidr = "172.17.0.1/16"  # 
    service_cidr       = "10.1.0.0/16"  #
  }
}


