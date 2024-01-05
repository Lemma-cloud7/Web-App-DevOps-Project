# Resource Group
resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.location
}

# Virtual Network
resource "azurerm_virtual_network" "aks_vnet" {
  name                = "aks-vnet"
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = azurerm_resource_group.aks_rg.name
}

# Control Plane Subnet
resource "azurerm_subnet" "control_plane_subnet" {
  name                 = "control-plane-subnet"
  resource_group_name  = azurerm_resource_group.aks_rg.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Worker Node Subnet
resource "azurerm_subnet" "worker_node_subnet" {
  name                 = "worker-node-subnet"
  resource_group_name  = azurerm_resource_group.aks_rg.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Network Security Group
resource "azurerm_network_security_group" "aks_nsg" {
  name                = "aks-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.aks_rg.name
}

# NSG Rule for kube-apiserver
resource "azurerm_network_security_rule" "kube_apiserver_rule" {
  name                        = "kube-apiserver-rule"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"  # kube-apiserver typically uses port 443
  source_address_prefix       = "192.0.2.0"  # Replace with your public IP
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.aks_rg.name
  network_security_group_name = azurerm_network_security_group.aks_nsg.name
}

# NSG Rule for SSH
resource "azurerm_network_security_rule" "ssh_rule" {
  name                        = "ssh-rule"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"  # SSH uses port 22
  source_address_prefix       = "192.0.2.0"  # Replace with your public IP
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.aks_rg.name
  network_security_group_name = azurerm_network_security_group.aks_nsg.name
}




############################
# # Resource Group
# resource "azurerm_resource_group" "aks_rg" {
#   name     = var.resource_group_name
#   location = var.location
# }

# # Virtual Network
# resource "azurerm_virtual_network" "aks_vnet" {
#   name                = "aks-vnet"
#   address_space       = var.vnet_address_space
#   location            = var.location
#   resource_group_name = azurerm_resource_group.aks_rg.name
# }

# # Control Plane Subnet
# resource "azurerm_subnet" "control_plane_subnet" {
#   name                 = "control-plane-subnet"
#   resource_group_name  = azurerm_resource_group.aks_rg.name
#   virtual_network_name = azurerm_virtual_network.aks_vnet.name
#   address_prefixes     = ["10.0.1.0/24"]
# }

# # Worker Node Subnet
# resource "azurerm_subnet" "worker_node_subnet" {
#   name                 = "worker-node-subnet"
#   resource_group_name  = azurerm_resource_group.aks_rg.name
#   virtual_network_name = azurerm_virtual_network.aks_vnet.name
#   address_prefixes     = ["10.0.2.0/24"]
# }

# # Network Security Group
# resource "azurerm_network_security_group" "aks_nsg" {
#   name                = "aks-nsg"
#   location            = var.location
#   resource_group_name = azurerm_resource_group.aks_rg.name
# }

# # NSG Rule for kube-apiserver
# resource "azurerm_network_security_rule" "kube_apiserver_rule" {
#   name                        = "kube-apiserver-rule"
#   priority                    = 100
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_range      = "443"  # kube-apiserver typically uses port 443
#   source_address_prefix       = "192.0.2.0"  # Replace with your public IP
#   destination_address_prefix  = "*"
#   resource_group_name         = azurerm_resource_group.aks_rg.name
#   network_security_group_name = azurerm_network_security_group.aks_nsg.name
# }

# # NSG Rule for SSH
# resource "azurerm_network_security_rule" "ssh_rule" {
#   name                        = "ssh-rule"
#   priority                    = 110
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_range      = "22"  # SSH uses port 22
#   source_address_prefix       = "192.0.2.0"  # Replace with your public IP
#   destination_address_prefix  = "*"
#   resource_group_name         = azurerm_resource_group.aks_rg.name
#   network_security_group_name = azurerm_network_security_group.aks_nsg.name
# }
