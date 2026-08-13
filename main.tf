
module "resource_group" {
  source   = "./modules/resource_group"
  rg_names = var.rg_names
}
module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "./modules/virtual_network"

  vnet_names = var.vnet_names

}
module "subnet" {
  depends_on = [module.virtual_network]
  source     = "./modules/subnet"

  subnet_names = var.subnet_names

}
module "nsg" {
  depends_on = [module.resource_group]
  source     = "./modules/nsg"

  nsgs = var.nsgs

}
module "nsg_association" {
  depends_on = [module.subnet, module.nsg]

  source = "./modules/nsg_association"

  rg_names         = var.rg_names
  vnet_names       = var.vnet_names
  subnet_names     = var.subnet_names
  nsgs             = var.nsgs
  nsg_associations = var.nsg_associations
}
module "public_ip" {
  depends_on = [module.resource_group]
  source     = "./modules/public_ip"

  public_ips = var.public_ips
}
module "network_interface" {
  depends_on = [module.subnet, module.public_ip]
  source     = "./modules/network_interface"

  nic_names = var.nic_names
}
module "virtual_machine" {
  depends_on = [module.network_interface]
  source     = "./modules/virtual_machine"

  vm_names = var.vm_names
}
module "load_balancer" {

  depends_on = [
    module.public_ip
  ]

  source = "./modules/load_balancer"

  load_balancers = var.load_balancers

}
module "nat_gateway" {
  depends_on = [
    module.public_ip
  ]

  source = "./modules/nat_gateway"

  nat_gateways = var.nat_gateways

}
module "route_table" {
  depends_on = [
    module.subnet
  ]

  source = "./modules/route_table"

  route_tables = var.route_tables

}
module "key_vault" {
  source = "./modules/key_vault"

  key_vaults = var.key_vaults
}
module "storage_account" {
  source = "./modules/storage_account"

  storage_accounts = var.storage_accounts

}
module "managed_disk" {
  source = "./modules/managed_disk"

  managed_disks = var.managed_disks
  vm_ids        = module.virtual_machine.vm_ids
}