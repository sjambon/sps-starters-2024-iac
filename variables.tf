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
