module "network" {
  source = "./modules/network_components"
  count  = var.enable_net ? 1 : 0
}

module "nsg" {
  source = "./modules/security_group"

  count             = var.enable_nsg ? 1 : 0
  location          = module.network[0].location[0]
  rg_name           = module.network[0].rg_name[0]
  net_interface_ids = module.network[0].net_interface_ids
}

module "vm" {
  source = "./modules/vm_config"

  count                  = var.enable_vm ? 1 : 0
  location               = module.network[0].location[0]
  rg_name                = module.network[0].rg_name[0]
  net_interface_ids      = module.network[0].net_interface_ids
  net_interface_ids_priv = module.network[0].net_interface_ids_priv
}

