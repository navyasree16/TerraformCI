terraform{
    required_version = ">=1.3.7"
    required_providers {
      azurerm={
        source = "hashicorp/azurerm"
        version = "~>3.43.0"

      }
    }
  cloud {
    organization = "Terraform_Navya"
    workspaces {
      name = "repository"
    }
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "terra-rg01"
  location = "East US"
}

provider "azurerm" {
  features {  
  }
}

resource "azurerm_storage_account" "storage" {
  name                     = "terraformstgacccnt01"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
  tags = {
    environment = "staging"
  }
}