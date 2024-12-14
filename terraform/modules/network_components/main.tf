resource "azurerm_resource_group" "some" {
  name     = var.rg_name
  location = var.az_region
}

resource "azurerm_virtual_network" "net" {
  name                = var.virtual_net
  address_space       = var.addr_range
  location            = azurerm_resource_group.some.location
  resource_group_name = azurerm_resource_group.some.name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet
  resource_group_name  = azurerm_resource_group.some.name
  virtual_network_name = azurerm_virtual_network.net.name
  address_prefixes     = [var.sub-addr-prefix]
}

resource "azurerm_public_ip" "ip" {
  count = var.pub_ip_cnt
  name  = "pub-ip-${count.index + 1}"
  location            = azurerm_resource_group.some.location
  resource_group_name = azurerm_resource_group.some.name
  allocation_method   = var.pub_ip_alloc_method
  sku                 = var.ip_sku
}

resource "azurerm_network_interface" "nic" {
  count = var.nic_cnt
  name  = "nic-${count.index + 1}"
  location            = azurerm_resource_group.some.location
  resource_group_name = azurerm_resource_group.some.name

  ip_configuration {
    name                          = "ip-config"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = var.priv_ip_alloc
    public_ip_address_id          = azurerm_public_ip.ip[count.index].id
  }
}
