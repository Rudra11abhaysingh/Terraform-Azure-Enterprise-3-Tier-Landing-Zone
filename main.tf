
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
  source = "./modules/nsg_association"

  subnet_ids       = module.subnet.subnet_ids
  nsg_ids          = module.nsg.nsg_ids
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




module "private_dns" {
  depends_on = [
    module.resource_group,
    module.virtual_network
  ]

  source = "./modules/private_dns"

  resource_group_name  = "rg-dev-001"
  virtual_network_name = "vnet-dev-001"
}

module "private_endpoint" {
  depends_on = [
    module.key_vault,
    module.subnet,
    module.private_dns
  ]

  source = "./modules/private_endpoint"

  private_endpoint_name = "pe-kv-dev-001"
  location              = "Central India"
  resource_group_name   = "rg-dev-001"

  subnet_id = module.subnet.subnet_ids["private_endpoint"]

  key_vault_id = module.key_vault.key_vault_ids["kv"]

  private_dns_zone_id = module.private_dns.private_dns_zone_id
}



module "bastion" {
  depends_on = [
    module.resource_group,
    module.subnet,
    module.public_ip
  ]

  source = "./modules/bastion"

  bastion      = var.azure_bastion
  subnet_id    = module.subnet.subnet_ids["bastion"]
  public_ip_id = module.public_ip.public_ip_ids["bastion"]
}
