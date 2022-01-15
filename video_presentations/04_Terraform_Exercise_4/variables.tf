variable "resource_group" {
  description = "Resource group name"
  type        = string
}

variable "labels" {
  description = "Tags to be used by resources."
  type        = map(any)
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "account_replication_type" {
  description = "Storage account replication"
  type        = map(any)
}


