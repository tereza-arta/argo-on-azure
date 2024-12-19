output "location" {
  value = azurerm_resource_group.some[*].location
}

output "rg_name" {
  value = azurerm_resource_group.some[*].name
}

output "net_interface_ids" {
  value = azurerm_network_interface.pub[*].id
}

output "net_interface_ids_priv" {
  value = azurerm_network_interface.priv[*].id
}

