resource "azurerm_resource_group" "some" {
  count    = var.rg_cnt
  name     = format("%s-%d", var.rg_name, count.index)
  location = var.az_region[var.reg_index]
}

resource "azurerm_virtual_network" "net" {
  count               = var.vnet_cnt
  name                = format("%s-%d", var.vnet_name, count.index)
  address_space       = [element(var.addr_range, count.index)]
  location            = var.az_region[var.reg_index]
  resource_group_name = azurerm_resource_group.some[count.index].name
}

resource "azurerm_subnet" "pub" {
  count                = var.pub-sub-cnt
  name                 = format("%s-%d", var.pub-sub-name, count.index)
  resource_group_name  = azurerm_resource_group.some[count.index].name
  virtual_network_name = azurerm_virtual_network.net[count.index].name
  address_prefixes     = [element(var.pub-sub-addr-prefix, count.index)]
}

resource "azurerm_subnet" "priv" {
  count                = var.priv-sub-cnt
  name                 = format("%s-%d", var.priv-sub-name, count.index)
  resource_group_name  = azurerm_resource_group.some[count.index].name
  virtual_network_name = azurerm_virtual_network.net[count.index].name
  address_prefixes     = [element(var.priv-sub-addr-prefix, count.index)]
}

resource "azurerm_public_ip" "ip" {
  count               = var.static_ip + var.dynamic_ip
  name                = "pub-ip-${count.index}"
  location            = var.az_region[var.reg_index]
  resource_group_name = azurerm_resource_group.some[var.rg_index].name
  allocation_method   = count.index < var.static_ip ? var.ip_alloc_method[0] : var.ip_alloc_method[1]
  sku                 = count.index < var.ip_sku_basic ? "Basic" : "Standard"
}

resource "azurerm_network_interface" "pub" {
  count               = var.pub_nic_cnt
  name                = "pub-nic-${count.index}"
  location            = var.az_region[var.reg_index]
  resource_group_name = azurerm_resource_group.some[var.rg_index].name

  ip_configuration {
    name                          = var.ip_cgf_name
    subnet_id                     = azurerm_subnet.pub[var.pub_sub_index].id
    private_ip_address_allocation = var.priv_ip_alloc[var.priv_ip_alloc_ind]
    public_ip_address_id          = azurerm_public_ip.ip[count.index].id
  }
}

resource "azurerm_network_interface" "priv" {
  count               = var.priv_nic_cnt
  name                = "priv-nic-${count.index}"
  location            = var.az_region[var.reg_index]
  resource_group_name = azurerm_resource_group.some[var.rg_index].name

  ip_configuration {
    name                          = var.ip_cgf_name
    subnet_id                     = azurerm_subnet.priv[var.priv_sub_index].id
    private_ip_address_allocation = var.priv_ip_alloc[var.priv_ip_alloc_ind]
  }
}

resource "azurerm_nat_gateway" "nat" {
  count                   = var.nat_cnt
  name                    = "var.nat_name-${count.index}"
  location                = var.az_region[var.reg_index]
  resource_group_name     = azurerm_resource_group.some[var.rg_index].name
  sku_name                = count.index < var.ip_sku_basic ? "Basic" : "Standard"
  idle_timeout_in_minutes = var.nat_idle_out
}

resource "azurerm_subnet_nat_gateway_association" "nat_sub_ass" {
  count          = var.nat_sub_ass_cnt
  subnet_id      = azurerm_subnet.priv[count.index].id
  nat_gateway_id = azurerm_nat_gateway.nat[count.index].id
}

