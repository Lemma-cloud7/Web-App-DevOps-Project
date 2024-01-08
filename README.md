# Web-App-DevOps-Project

Welcome to the Web App DevOps Project repo! This application allows you to efficiently manage and track orders for a potential business. It provides an intuitive user interface for viewing existing orders and adding new ones.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Technology Stack](#technology-stack)
- [Contributors](#contributors)
- [License](#license)

## Features

- **Order List:** View a comprehensive list of orders including details like date UUID, user ID, card number, store code, product code, product quantity, order date, and shipping date.
  
![Screenshot 2023-08-31 at 15 48 48](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/3a3bae88-9224-4755-bf62-567beb7bf692)

- **Pagination:** Easily navigate through multiple pages of orders using the built-in pagination feature.
  
![Screenshot 2023-08-31 at 15 49 08](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/d92a045d-b568-4695-b2b9-986874b4ed5a)

- **Add New Order:** Fill out a user-friendly form to add new orders to the system with necessary information.
  
![Screenshot 2023-08-31 at 15 49 26](https://github.com/maya-a-iuga/Web-App-DevOps-Project/assets/104773240/83236d79-6212-4fc3-afa3-3cee88354b1a)

- **Data Validation:** Ensure data accuracy and completeness with required fields, date restrictions, and card number validation.

## Getting Started

### Prerequisites

For the application to succesfully run, you need to install the following packages:

- flask (version 2.2.2)
- pyodbc (version 4.0.39)
- SQLAlchemy (version 2.0.21)
- werkzeug (version 2.2.3)

### Usage

To run the application, you simply need to run the `app.py` script in this repository. Once the application starts you should be able to access it locally at `http://127.0.0.1:5000`. Here you will be meet with the following two pages:

1. **Order List Page:** Navigate to the "Order List" page to view all existing orders. Use the pagination controls to navigate between pages.

2. **Add New Order Page:** Click on the "Add New Order" tab to access the order form. Complete all required fields and ensure that your entries meet the specified criteria.

## Technology Stack

- **Backend:** Flask is used to build the backend of the application, handling routing, data processing, and interactions with the database.

- **Frontend:** The user interface is designed using HTML, CSS, and JavaScript to ensure a smooth and intuitive user experience.

- **Database:** The application employs an Azure SQL Database as its database system to store order-related data.
- # Documentation for the `delivery_date` Feature

## Introduction

This document provides comprehensive details about the `delivery_date` feature that was implemented and later reverted in the Web App DevOps Project. This feature aimed to add a delivery date attribute to the orders in the application.

## For Developers

### Overview of the Feature

The `delivery_date` feature was designed to allow users to specify and view the delivery dates for orders. This feature involves changes in the database schema, the backend Python script (`app.py`), and the frontend HTML template (`order.html`).

### Implementation Details

#### Database Schema Changes

- A new column named `delivery_date` of type `DateTime` was added to the `orders` table in the backend database.

#### Backend Changes (`app.py`)

- Order class in `app.py` was modified to include the `delivery_date` attribute.
- Routes handling order creation and display were updated to process the `delivery_date`.

#### Frontend Changes (`order.html`)

- The `order.html` template was updated to include an input field for adding and a table column for displaying the `delivery_date`.


### Troubleshooting

- **Database Connection Issue:**
  - Ensure the correct database credentials and connection strings are used.
  - Verify network accessibility to the Azure SQL Database.
  - Check if the ODBC driver is installed and configured correctly.
### Reverting the Feature

- The feature was reverted due to a change in project requirements. The revert process involved the following steps:
  - Identifying the commit hash prior to the feature implementation.
  - Executing `git revert COMMIT_HASH`.
  - Resolving any merge conflicts and committing the revert.

## Conclusion

While the `delivery_date` feature is currently not part of the application, this documentation serves as a reference for future implementation needs. The feature could be reintroduced or modified based on future project requirements.



# Docker Containerization Documentation

## Introduction

Containerization with Docker ensures a consistent and isolated environment for the application, facilitating easier development, testing, and deployment.

## Dockerfile Breakdown

The Dockerfile is a crucial component in the Docker containerization process. It defines the environment in which the application runs. Here’s a breakdown of the Dockerfile:

### Base Image

- `python:3.8-slim`
- **Purpose:** This image provides a lightweight Python environment which is ideal for running the Flask application.
### Working Directory

-  `WORKDIR /app`
- **Purpose:** Sets the working directory inside the container. This is where the application code resides in the container.

### Copy Application Files

-  `COPY . /app`
- **Purpose:** Copies our application files from the current directory on the host into the `/app` directory in the container.

### Install Dependencies

- **ODBC Driver and System Dependencies:**
  - Includes installation of `unixodbc`, `unixodbc-dev`, `odbcinst`, `libpq-dev`, `gcc`, and `msodbcsql17`.
  - **Purpose:** These are necessary for establishing a connection to the Azure SQL Database.
- **Python Packages:**
  - **Command:** `RUN pip install --trusted-host pypi.python.org -r requirements.txt`
  - **Purpose:** Installs the Python packages required for the application, as specified in `requirements.txt`.

### Exposing Port

- **Directive:** `EXPOSE 5000`
- **Purpose:** Exposes port 5000 of the container, allowing the Flask application to be accessible.

### Startup Command

- **Directive:** `CMD ["python", "app.py"]`
- **Purpose:** Specifies the command to run the Flask application when the container starts.

## Docker Commands Used

Documenting the Docker commands used in the project:

- **Build the Image:**
  - `docker build -t <image-name> .`
  - **Explanation:** This command builds the Docker image from the Dockerfile in the current directory.
- **Run the Container:**
  - `docker run -p 5000:5000 <image-name>`
  - **Explanation:** Runs the Docker container and maps port 5000 of the container to port 5000 on the host machine.
- **Tagging the Image for Docker Hub:**
  - `docker tag <local-image-name> <docker-hub-username>/<image-name>:<tag>`
  - **Explanation:** Tags the image for pushing to Docker Hub.
- **Pushing to Docker Hub:**
  - `docker push <docker-hub-username>/<image-name>:<tag>`
  - **Explanation:** Pushes the image to Docker Hub.

## Image Information

- **Name and Tag:** `<docker-hub-username>/<image-name>:<tag>`
- **Usage:** Include instructions or special notes about using the image.

## Cleanup Process

To maintain a tidy development environment:

- **Remove Containers:**
  - List containers: `docker ps -a`
  - Remove a container: `docker rm <container-id>`
- **Remove Images:**
  - List images: `docker images -a`
  - Remove an image: `docker rmi <image-id>`

## Conclusion

This documentation aims to provide a clear understanding of the containerization process with Docker. It should serve as a reference for current and future team members working on the Project.



# Infrastructure as Code for Networking Services

## Overview

This document outlines the process and steps taken to define networking resources for an Azure Kubernetes Service (AKS) cluster using Terraform. This approach ensures a repeatable, consistent deployment of the networking infrastructure.

## Terraform Networking Module

### Resources Created

1. **Azure Resource Group (`azurerm_resource_group`):**
   - **Purpose:** Serves as a container that holds related resources for this networking solution.
   - **Name:** Defined by `resource_group_name` variable.

2. **Virtual Network (VNet) (`azurerm_virtual_network`):**
   - **Purpose:** Provides a private network for the AKS cluster.
   - **Name:** "aks-vnet"
   - **Address Space:** Specified by `vnet_address_space` variable.

3. **Subnets (`azurerm_subnet`):**
   - **Control Plane Subnet (`control-plane-subnet`):**
     - Hosts the control plane components of the AKS cluster.
   - **Worker Node Subnet (`worker-node-subnet`):**
     - Used for AKS worker nodes.
   - **Dependencies:** Both subnets depend on the VNet.

4. **Network Security Group (NSG) (`azurerm_network_security_group`):**
   - **Purpose:** Provides security rules for network traffic to and from Azure resources.
   - **Name:** "aks-nsg"

5. **NSG Rules (`azurerm_network_security_rule`):**
   - **kube-apiserver-rule:**
     - Allows traffic to the kube-apiserver.
   - **ssh-rule:**
     - Enables SSH traffic for management purposes.
   - **Source Address:** Configured for a placeholder IP (or specific IPs as needed).

### Input Variables

- `resource_group_name`: The name for the Azure Resource Group.
- `location`: Azure region for deploying resources.
- `vnet_address_space`: Address space for the Virtual Network.

### Output Variables

- `vnet_id`: The ID of the Virtual Network.
- `control_plane_subnet_id`: The ID of the control plane subnet.
- `worker_node_subnet_id`: The ID of the worker node subnet.
- `networking_resource_group_name`: The name of the resource group used.
- `aks_nsg_id`: The ID of the Network Security Group.

### Steps to Apply Configuration

1. **Initialize Terraform:**
   - Run `terraform init` in the root directory to initialize the project.

2. **Plan Deployment:**
   - Execute `terraform plan` to review the changes Terraform will make.

3. **Apply Configuration:**
   - Run `terraform apply` to apply the configuration and create resources.
  

# Provisioning AKS Cluster using Terraform

## Overview

This section of the documentation outlines the steps and configurations used to provision an Azure Kubernetes Service (AKS) cluster using Terraform as part of the Infrastructure as Code (IaC) strategy.

## AKS Cluster Module in Terraform

### Defining the Cluster

The AKS cluster is defined in the `aks-cluster-module`. This module sets up the Kubernetes cluster with specified configurations using Azure as the cloud provider.

### Input Variables

1. **aks_cluster_name**
   - **Description:** Specifies the name of the AKS cluster.
   - **Type:** string

2. **cluster_location**
   - **Description:** Azure region where the AKS cluster will be deployed.
   - **Type:** string

3. **dns_prefix**
   - **Description:** DNS prefix for the AKS cluster.
   - **Type:** string

4. **kubernetes_version**
   - **Description:** Kubernetes version for the AKS cluster.
   - **Type:** string

5. **service_principal_client_id**
   - **Description:** Client ID for the service principal.
   - **Type:** string

6. **service_principal_secret**
   - **Description:** Client Secret for the service principal.
   - **Type:** string

7. **Networking Module Variables**
   - **Includes:** `resource_group_name`, `vnet_id`, `control_plane_subnet_id`, and `worker_node_subnet_id`.
   - **Description:** These variables are passed from the networking module to define the network configuration for the AKS cluster.

### Output Variables

1. **aks_cluster_name**
   - **Description:** The name of the provisioned AKS cluster.

2. **aks_cluster_id**
   - **Description:** The ID of the provisioned AKS cluster.

3. **aks_kubeconfig**
   - **Description:** Kubernetes configuration file for managing the AKS cluster.

### Steps to Provision

1. **Initialize the Module:**
   - Run `terraform init` inside the `aks-cluster-module`.

2. **Plan the Deployment:**
   - Execute `terraform plan` to preview the changes.

3. **Apply the Configuration:**
   - Run `terraform apply` to provision the AKS cluster.
  

# Azure Kubernetes Service (AKS) Terraform Configuration

This repository contains the Infrastructure as Code (IaC) for setting up an Azure Kubernetes Service (AKS) cluster using Terraform. The configuration includes a main file that sets up the provider and integrates networking and AKS cluster modules.

## Main Configuration File

The `main.tf` file is the heart of the Terraform configuration. It contains the following key components:

### Provider Setup

The Azure provider is configured to allow Terraform to interact with Azure resources.

provider "azurerm" {
  features {}
}
Credentials are not hard-coded but are supplied via environment variables in the secrets.tfvars file for enhanced security.
Networking Module Integration
The networking module sets up the necessary network infrastructure for the AKS cluster.
module "networking" {
  source = "./networking-module"
  resource_group_name = "networking-resource-group"
  location = "UK South"
  vnet_address_space = ["10.0.0.0/16"]
}
Input Variables:

resource_group_name: Name of the Azure resource group for networking resources.
location: Azure region where networking resources are deployed.
vnet_address_space: CIDR block for the virtual network.
## AKS Cluster Module Integration
The AKS cluster module provisions the Kubernetes cluster within the defined network infrastructure.
Input Variables:

cluster_name: Name of the AKS cluster.
location: Azure region for AKS cluster deployment.
dns_prefix: DNS prefix for AKS cluster.
kubernetes_version: Version of Kubernetes for the AKS cluster.
service_principal_client_id and service_principal_secret: Credentials for Azure service principal.
Networking related variables (resource_group_name, vnet_id, control_plane_subnet_id, worker_node_subnet_id) are sourced from the networking module.



## Contributors 

- [Maya Iuga]([https://github.com/yourusername](https://github.com/maya-a-iuga))

## License

This project is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.
