variable "endpoint_id" {
  description = "Value of the resource ID for the Azure CDN Endpoint"
  type        = string
}

variable "domain_name" {
  description = "Domain name used for the website"
  type        = string
}

variable "endpoint_origin_hostname" {
  description = "Value of the origin host name for the CDN endpoint"
  type        = string
}

variable "endpoint_origin_name" {
  description = "Value of the name of the CDN endpoint origin"
  type        = string
}

variable "state_storage_account_name" {
  description = "Value of the name of the storage account where the TFSTATE file is"
  type        = string
}

variable "state_resource_group_name" {
  description = "Value of the name of the resource group containing the storage account where the TFSTATE file is"
  type        = string
}