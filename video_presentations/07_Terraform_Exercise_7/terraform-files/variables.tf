variable "resource_name" {
  description = "resource"
  type        = string
}

variable "location" {
  description = "azure region"
  default     = "eastus"
  type        = string
}

variable "labels" {
  description = "labels"
  type        = map(any)
}

variable "acc_net" {
  description = "accelerated network"
  type        = bool
}

variable "vmSize" {
  description = "sizes"
  type        = map(any)
}

variable "storageSize" {
  description = "disk"
  type        = number
}

variable "username" {
  description = "user"
  type        = list(any)
}

variable "diskSize" {
  description = "disk"
  type        = number
}

variable "storageAccType" {
  description = "acct"
  type        = string
}

variable "account_replication_type" {
  description = "replication options"
  type        = map(any)
}

variable "publisher" {
  description = "publisher"
  type        = string
}

variable "offer" {
  description = "offer"
  type        = string
}

variable "sku" {
  description = "sku"
  type        = string
}

variable "osVersion" {
  description = "os"
  type        = string
}
