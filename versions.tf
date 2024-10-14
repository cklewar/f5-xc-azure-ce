terraform {
  required_version = ">= 1.7.0"
  /*cloud {
    organization = "cklewar"
    hostname     = "app.terraform.io"

    workspaces {
      name = "f5-xc-azure-ce-module"
    }
  }*/

  required_providers {

    volterra = {
      source  = "volterraedge/volterra"
      version = "= 0.11.37"
    }

    restful = {
      source  = "magodo/restful"
      version = ">= 0.16.1"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.25.0"
    }

    http-full = {
      source  = "salrashid123/http-full"
      version = ">= 1.3.1"
    }

    local = ">= 2.2.3"
    null  = ">= 3.1.1"
  }
}