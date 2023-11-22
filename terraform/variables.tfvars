variable "endpoint_id" {
  description = "Value of the resource ID for the Azure CDN Endpoint"
  type = string
  default = "/subscriptions/fcb20762-8b8f-4e0a-8d02-28913debf2d2/resourceGroups/production_storage/providers/Microsoft.Cdn/profiles/technoliterate-cdn/endpoints/techno-literate-cdn"
}

variable "domain_name" {
  description = "Domain name used for the website"
  type = string
  default = "resume.techno-literate.com"
}

variable "endpoint_origin_hostname" {
  description = "Value of the origin host name for the CDN endpoint"
  type = string
  default = "tlprodstore.z5.web.core.windows.net"
}

variable "endpoint_origin_name" {
  description = "Value of the name of the CDN endpoint origin"
  type = string
  default = "default-origin-37836f6a"
}