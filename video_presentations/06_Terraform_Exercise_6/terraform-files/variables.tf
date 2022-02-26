variable "resource_groups" {
  description = "Resource group names"
  type        = list(any)
}

variable "labels" {
  description = "Tags to be used by resources."
  type        = map(any)
}

variable "location" {
  description = "Azure region"
  type        = string
}



