# Input Variables for AKS Cluster Module

# AKS Cluster Name
variable "aks_cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
}

# Cluster Location
variable "cluster_location" {
  description = "The Azure region where the AKS cluster will be deployed."
  type        = string
}

# DNS Prefix
variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster."
  type        = string
}

# Kubernetes Version
variable "kubernetes_version" {
  description = "The version of Kubernetes to use for the AKS cluster."
  type        = string
}

# Service Principal Client ID
variable "service_principal_client_id" {
  description = "The Client ID for the service principal associated with the AKS cluster."
  type        = string
}

# Service Principal Secret
variable "service_principal_secret" {
  description = "The Client Secret for the service principal."
  type        = string
}

# Networking Module Variables

# Resource Group Name from Networking Module
variable "resource_group_name" {
  description = "The name of the Resource Group where networking resources are provisioned."
  type        = string
}

# Virtual Network ID from Networking Module
variable "vnet_id" {
  description = "The ID of the Virtual Network (VNet)."
  type        = string
}

# Control Plane Subnet ID from Networking Module
variable "control_plane_subnet_id" {
  description = "The ID of the subnet for the AKS control plane."
  type        = string
}

# Worker Node Subnet ID from Networking Module
variable "worker_node_subnet_id" {
  description = "The ID of the subnet for AKS worker nodes."
  type        = string
}


