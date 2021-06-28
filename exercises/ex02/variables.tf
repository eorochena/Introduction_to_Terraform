variable "resource_group" {
  description = "Resource group name"
  type = string
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
}

variable "username" {
  description = "Admin user"
  type = list
}

