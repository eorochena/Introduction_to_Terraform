variable "resource_group" {
  description = "Resource group name"
  type = string
}

variable "labels" {
  description = "Tags to be used by resources."
  type = map
}

variable "region" {
  description = "Azure region"
  type = string
}

variable "acc_net" {
  description = "Azure accelerated network"
  type = bool
  default = true
}

variable "vmSize" {
  description = "Azure VM series"
  type = map
}

variable "storageAccType" {
  description = "Storage account type"
  type = string
}

variable "publisher" {
  description = "OS publisher"
  type = string
}

variable "numVMs" {
  description = "Number of instances"
  type = number
}

variable "diskSize" {
  description = "Disk size"
  type = number
  validation {
    condition = var.diskSize >= 30 && var.diskSize < 101
    error_message = "Minimum disk size should be 30G but not bigger 100G."
  }
}

variable "username" {
  description = "Admin user"
  type = list
}

