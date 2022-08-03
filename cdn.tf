resource "azurerm_cdn_profile" "resume_cdn" {
  name                = var.cdn
  location            = var.location
  resource_group_name = var.rg
  sku                 = "Standard_Verizon"
}

resource "azurerm_cdn_endpoint" "resume_endpoint" {
  name                = var.endpoint
  profile_name        = var.cdn
  location            = var.location
  resource_group_name = var.rg

  origin {
    name      = "origin1"
    host_name = var.sa
  }
}