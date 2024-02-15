
#tf
terraform {
  backend "azurerm" {}
}

#provider
provider "azurerm" {
	features {}
}

#rg Creation
resource "azurerm_resource_group" "test" {
  name     = var.resource_group_name
  location = var.location

  #tags
  tags = {
    environment = "staging"
  }
}

