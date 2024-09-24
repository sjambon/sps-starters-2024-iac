variable "subscription_id" {
    description = "The subscription for the Service Principal"
    type        = string
    sensitive   = true
}

variable "client_id" {
    description = "The client ID for the Service Principal"
    type        = string
    sensitive   = true
}

variable "client_secret" {
    description = "The client secret for the Service Principal"
    type        = string
    sensitive   = true
}

variable "tenant_id" {
    description = "The tenant ID for the Service Principal"
    type        = string
    sensitive   = true
}

variable "prefix" {
    default     = "sps"
    description = "A prefix used for all resources in this example"
}

variable "location" {
    default     = "westeurope"
    description = "The Azure Region in which all resources in this example should be provisioned"
}

variable "default_tags" {
  type        = map(string)
  description = "set of default tags to apply everywhere"
}

variable "environment" {
  description = "Name of the environment of the resources"
  type        = string
}
