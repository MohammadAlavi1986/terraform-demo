provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

/*module "network" {
  source = "./modules/azure-network"
  vnet_name  = "vnet1"
  resource_group_name = azurerm_resource_group.example.name
  address_space = var.address_space
  subnets = var.subnets
  depends_on = [azurerm_resource_group.example]
}*/


module "network" {
  source  = "app.terraform.io/smash/network/azure"
  version = "1.0.1"

  vnet_name  = "vnet1"
  resource_group_name = azurerm_resource_group.example.name
  address_space = var.address_space
  subnets = var.subnets
  depends_on = [azurerm_resource_group.example]
}

output "subnet_prefixex" {
  value = module.network.subnet_prefixex
}
