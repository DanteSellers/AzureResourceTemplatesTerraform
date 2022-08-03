resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.rg
}

resource "azurerm_subnet" "vnet" {
  name                 = "subnet1"
  resource_group_name  = var.rg
  virtual_network_name = var.vnet
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "vnic" {
  name                = var.vnic
  location            = var.location
  resource_group_name = var.rg

  #I changed line 28 to allocate private ip to var.vm
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                = var.vm
  resource_group_name = var.rg
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "!MpDry#t*QC7n&DF2L8lL01O4T8$JS6T0Q5e!Cwp"
  network_interface_ids = [
    azurerm_network_interface.vnic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
