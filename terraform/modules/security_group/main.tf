resource "azurerm_network_security_group" "nsg" {
  count               = var.nsg_cnt
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_network_security_rule" "allow_in" {
  count                       = var.tcp_cnt + var.udp_cnt
  name                        = "${var.rule_type_1}-${count.index}"
  priority                    = 100 + (count.index * 10)
  direction                   = var.rule_type_1
  access                      = "Allow"
  protocol                    = count.index < var.tcp_cnt ? "Tcp" : "Udp"
  source_port_range           = var.src_port_range
  destination_port_range      = var.dest_port_range[count.index]
  source_address_prefix       = var.src_addr_prefix
  destination_address_prefix  = var.dest_addr_prefix
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.nsg[var.sg_index].name
}

#resource "azurerm_network_security_rule" "deny_out" {
#  count                       = var.outbound_cnt
#  name                        = "${var.rule_type_2}-${count.index}"
#  priority                    = 400 + (count.index * 10)
#  direction                   = var.rule_type_2
#  access                      = "Deny"
#  protocol                    = var.rule_protocol
#  source_port_range           = var.src_port_range
#  destination_port_range      = var.out_dest_port_range[count.index]
#  source_address_prefix       = var.src_addr_prefix
#  destination_address_prefix  = var.dest_addr_prefix
#  resource_group_name         = var.rg_name
#  network_security_group_name = azurerm_network_security_group.nsg[var.sg_index].name
#}

resource "azurerm_network_interface_security_group_association" "nsg-nic" {
  count                     = length(var.net_interface_ids)
  network_interface_id      = var.net_interface_ids[count.index]
  network_security_group_id = azurerm_network_security_group.nsg[var.sg_index].id
}

