variable "project_prefix" {
  type        = string
  description = "prefix string put in front of string"
  default     = "f5xc"
}

variable "project_suffix" {
  type        = string
  description = "prefix string put at the end of string"
  default     = "02"
}

variable "f5xc_namespace" {
  type    = string
  default = "system"
}

variable "f5xc_azure_region" {
  type    = string
  default = "eastus"
}

variable "f5xc_api_p12_file" {
  type = string
}

variable "f5xc_api_url" {
  type = string
}

variable "f5xc_tenant" {
  type = string
}

variable "f5xc_api_token" {
  type = string
}

variable "f5xc_azure_cred" {
  type    = string
  default = "sun-az-creds"
}

variable "azure_client_id" {
  type = string
}

variable "azure_client_secret" {
  type = string
}

variable "azure_tenant_id" {
  type = string
}

variable "azure_subscription_id" {
  type = string
}

variable "ssh_public_key_file" {
  type = string
}