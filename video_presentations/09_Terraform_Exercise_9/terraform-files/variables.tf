variable "resource_group" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  default     = "eastus"
  type        = string
}
