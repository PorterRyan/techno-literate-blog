variable "domain_name" {
  description = "Domain name used for the website"
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