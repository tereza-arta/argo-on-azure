resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_network_security_rule" "for-ssh" {
  name                        = var.sg_rule_1_name
  priority                    = var.sg_rule_1_prt
  direction                   = var.sg_rule_type
  access                      = var.sg_rule_access
  protocol                    = var.sg_rule_protocol
  source_port_range           = var.sg_src_port_range
  destination_port_range      = var.sg_dest_port_range
  source_address_prefix       = var.addr_prefix
  destination_address_prefix  = var.addr_prefix
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_security_rule" "for-http" {
  name                        = var.sg_rule_2_name
  priority                    = var.sg_rule_2_prt
  direction                   = var.sg_rule_type
  access                      = var.sg_rule_access
  protocol                    = var.sg_rule_protocol
  source_port_range           = var.sg_src_port_range
  destination_port_range      = var.sg_dest_port_range
  source_address_prefix       = var.addr_prefix
  destination_address_prefix  = var.addr_prefix
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_security_rule" "np" {
  name                        = var.sg_rule_3_name
  priority                    = var.sg_rule_3_prt
  direction                   = var.sg_rule_type
  access                      = var.sg_rule_access
  protocol                    = var.sg_rule_protocol
  source_port_range           = var.sg_src_port_range
  destination_port_range      = var.argo-app-nodeport
  source_address_prefix       = var.addr_prefix
  destination_address_prefix  = var.addr_prefix
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_security_rule" "np-2" {
  name                        = var.sg_rule_4_name
  priority                    = var.sg_rule_4_prt
  direction                   = var.sg_rule_type
  access                      = var.sg_rule_access
  protocol                    = var.sg_rule_protocol
  source_port_range           = var.sg_src_port_range
  destination_port_range      = var.base-app-nodeport
  source_address_prefix       = var.addr_prefix
  destination_address_prefix  = var.addr_prefix
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_interface_security_group_association" "nsg-nic" {
  count                     = length(var.net_interface_ids)
  network_interface_id      = var.net_interface_ids[count.index]
  network_security_group_id = azurerm_network_security_group.nsg.id
}
