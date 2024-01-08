#This is the vertion form master branch
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  # Credentials are supplied via 'secrets.tfvars' or environment variables
}

# Integrate the Networking Module
module "networking" {
  source = "./networking-module"  
  # Provide the required input variables for the networking module
  resource_group_name = "networking-resource-group"
  location            = "UK South"
  vnet_address_space  = ["10.0.0.0/16"]
}
# Integrate the AKS Cluster Module
module "aks_cluster" {
  source = "./aks-cluster-module"

  aks_cluster_name            = "terraform-aks-cluster"
  cluster_location            = "UK South"
  dns_prefix                  = "myaks-project"
  kubernetes_version          = "1.26.6"
  service_principal_client_id = var.service_principal_client_id
  service_principal_secret    = var.service_principal_secret

  
  resource_group_name     = module.networking.networking_resource_group_name
  vnet_id                 = module.networking.vnet_id
  control_plane_subnet_id = module.networking.control_plane_subnet_id
  worker_node_subnet_id   = module.networking.worker_node_subnet_id
}


