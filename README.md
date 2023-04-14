# AZURE CLOUD CE

Terraform to create F5XC Azure cloud CE

## Usage

- Clone this repo with `git clone --recurse-submodules https://github.com/cklewar/f5-xc-azure-ce`
- Enter repository directory with `cd azure cloud ce`
- Obtain F5XC API certificate file from Console and save it to `cert` directory
- Pick and choose from below examples and add mandatory input data and copy data into file `main.py.example`.
- Rename file __main.tf.example__ to __main.tf__ with `rename main.py.example main.py`
- Change backend settings in `versions.tf` file to fit your environment needs
- Initialize with `terraform init`
- Apply with `terraform apply -auto-approve` or destroy with `terraform destroy -auto-approve`

## Azure Cloud CE Single Node Single NIC module usage example

````hcl
provider "volterra" {
  api_p12_file = var.f5xc_api_p12_file
  url          = var.f5xc_api_url
  alias        = "default"
}

provider "azurerm" {
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
  tenant_id       = var.azure_tenant_id
  subscription_id = var.azure_subscription_id
  alias           = "default"
  features {}
}

/*resource "azurerm_marketplace_agreement" "ce" {
  publisher = var.f5xc_azure_marketplace_agreement_publisher
  offer     = var.f5xc_azure_marketplace_agreement_offers[var.f5xc_ce_gateway_type]
  plan      = var.f5xc_azure_marketplace_agreement_plans[var.f5xc_ce_gateway_type]
  provider  = azurerm.default
}*/

module "ce" {
  source              = "./modules/f5xc/ce/azure"
  f5xc_tenant         = var.f5xc_tenant
  f5xc_api_url        = var.f5xc_api_url
  f5xc_namespace      = var.f5xc_namespace
  f5xc_api_token      = var.f5xc_api_token
  f5xc_azure_region   = var.f5xc_azure_region
  f5xc_cluster_name   = format("%s-%s-%s", var.project_prefix, "azure-ce", var.project_suffix)
  f5xc_azure_az_nodes = {
    node0 = {
      f5xc_azure_vnet_slo_subnet = "192.168.0.0/26",
      f5xc_azure_az              = "1"
    }
  }
  f5xc_cluster_labels             = {
    "ves.io/fleet" : format("%s-aws-ce-test-%s", var.project_prefix, var.project_suffix)
  }
  f5xc_ce_gateway_type            = var.f5xc_ce_gateway_type
  f5xc_cluster_latitude           = 50.110924
  f5xc_cluster_longitude          = 8.682127
  azurerm_client_id               = var.azure_client_id
  azurerm_tenant_id               = var.azure_tenant_id
  azurerm_client_secret           = var.azure_client_secret
  azurerm_subscription_id         = var.azure_subscription_id
  azurerm_vnet_address_space      = ["192.168.0.0/21"]
  azure_security_group_rules_slo  = []
  azurerm_instance_admin_username = "centos"
  owner_tag                       = "c.klewar@f5.com"
  is_sensitive                    = false
  has_public_ip                   = true
  ssh_public_key                  = file(var.ssh_public_key_file)
  providers                       = {
    volterra = volterra.default
    azurerm  = azurerm.default
  }
}
````