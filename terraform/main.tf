module "network" {
  source = "./modules/network_components"

  enable_net = var.enable_net
  count      = var.enable_net ? 1 : 0
}

module "nsg" {
  source = "./modules/security_group"

  enable_nsg        = var.enable_nsg
  count             = var.enable_nsg ? 1 : 0
  location          = module.network[0].location
  rg_name           = module.network[0].rg_name
  net_interface_ids = module.network[0].net_interface_ids
}

module "vm" {
  source = "./modules/vm_config"

  enable_vm         = var.enable_vm
  count             = var.enable_vm ? 1 : 0
  location          = module.network[0].location
  rg_name           = module.network[0].rg_name
  net_interface_ids = module.network[0].net_interface_ids
}
