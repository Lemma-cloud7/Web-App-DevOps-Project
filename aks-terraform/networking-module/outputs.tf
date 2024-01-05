# Output variable for Virtual Network ID
output "vnet_id" {
  description = "The ID of the Virtual Network."
  value       = azurerm_virtual_network.aks_vnet.id
}

# Output variable for Control Plane Subnet ID
output "control_plane_subnet_id" {
  description = "The ID of the subnet for AKS control plane."
  value       = azurerm_subnet.control_plane_subnet.id
}

# Output variable for Worker Node Subnet ID
output "worker_node_subnet_id" {
  description = "The ID of the subnet for AKS worker nodes."
  value       = azurerm_subnet.worker_node_subnet.id
}

# Output variable for Networking Resource Group Name
output "networking_resource_group_name" {
  description = "The name of the Resource Group where networking resources are provisioned."
  value       = azurerm_resource_group.aks_rg.name
}

# Output variable for Network Security Group ID
output "aks_nsg_id" {
  description = "The ID of the Network Security Group."
  value       = azurerm_network_security_group.aks_nsg.id
}



#################
# # Output variable for Virtual Network ID
# output "vnet_id" {
#   description = "The ID of the Virtual Network."
#   value       = azurerm_virtual_network.aks_vnet.id
# }

# # Output variable for Control Plane Subnet ID
# output "control_plane_subnet_id" {
#   description = "The ID of the subnet for AKS control plane."
#   value       = azurerm_subnet.control_plane_subnet.id
# }

# # Output variable for Worker Node Subnet ID
# output "worker_node_subnet_id" {
#   description = "The ID of the subnet for AKS worker nodes."
#   value       = azurerm_subnet.worker_node_subnet.id
# }

# # Output variable for Networking Resource Group Name
# output "networking_resource_group_name" {
#   description = "The name of the Resource Group where networking resources are provisioned."
#   value       = azurerm_resource_group.aks_rg.name
# }

# # Output variable for Network Security Group ID
# output "aks_nsg_id" {
#   description = "The ID of the Network Security Group."
#   value       = azurerm_network_security_group.aks_nsg.id
# }
