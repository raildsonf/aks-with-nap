variable "subscription_id" {
  description = "Azure Subscription ID"
  default     = ""
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  default     = ""
}

variable "location" {
  default = "westus3"
}

variable "rg_name" {
  default = "rg-aks-nap"
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
