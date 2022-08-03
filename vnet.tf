resource "azurerm_network_security_group" "sg" {
  name                = var.sg
  location            = var.location
  resource_group_name = var.rg

}

resource "azurerm_network_security_rule" "ib_sr" {
  name                        = "inbound_sr"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = 
  destination_address_prefix  = "*"
  resource_group_name         = var.rg
  network_security_group_name = var.sg
}

resource "azurerm_public_ip" "publicip" {
  name                = var.pip
  resource_group_name = var.rg
  location            = var.location
  allocation_method   = "Dynamic"

}
