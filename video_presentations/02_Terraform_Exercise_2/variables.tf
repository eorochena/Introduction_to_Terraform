variable "resource_group" {
  description = "Resource Group Name"
  type        = string
}

variable "region" {
  description = "Azure region"
  type        = string
}

variable "numVMs" {
  description = "number of virtual machines"
  type        = number
}

variable "vmSize" {
  description = "Azure VM series"
  type        = map(any)
}

variable "username" {
  description = "Admin user"
  type        = list(any)
}

variable "storage_account_type" {
  description = "storage account type"
  type        = list(any)
}

variable "diskSize" {
  description = "storage size"
  type        = number
}
