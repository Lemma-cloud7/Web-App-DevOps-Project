# Variables for the Networking Module

# Variable for Azure Resource Group Name
variable "resource_group_name" {
  description = "The name of the Azure Resource Group where networking resources will be deployed."
  type        = string
  default     = "myResourceGroup"  # Replace with your desired default value
}

# Variable for Azure Region Location
variable "location" {
  description = "The Azure region where the networking resources will be deployed."
  type        = string
  default     = "East US"  # Replace with your desired default value
}

# Variable for Virtual Network Address Space
variable "vnet_address_space" {
  description = "The address space for the Virtual Network (VNet)."
  type        = list(string)
  default     = ["10.0.0.0/16"]  # Replace with your desired default value
}
