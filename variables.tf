variable "subscription_id" {
  description = "Azure Subscription ID"
  default     = "4777093...................."
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  default     = "faca7....................."
}

variable "location" {
  default = "eastus"
}

variable "rg_name" {
  default = "dhub"
}

variable "vnet_name" {
  default = "vnet-aks-nap"
}

variable "subnet_name" {
  default = "subnet-aks-nap"
}

variable "aks_name" {
  default = "aks-nap-demo"
}

variable "identity_name" {
  default = "aks-nap-identity"
}
