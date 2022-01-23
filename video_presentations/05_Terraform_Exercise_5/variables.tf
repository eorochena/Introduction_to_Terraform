variable "resource_information" {
  description = "resource"
  type        = map(any)
}

variable "labels" {
  description = "labels"
  type        = map(any)
}

variable "subnets" {
  description = "subnets"
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
