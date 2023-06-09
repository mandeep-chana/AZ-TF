

#
# Private endpoint
#

module "private_endpoint" {
  source   = "../../networking/private_endpoint"
  for_each = try(var.settings.private_endpoints, {})

  base_tags           = var.base_tags
  tags                = local.tags
  client_config       = var.client_config
  global_settings     = var.global_settings
  location            = local.location
  name                = each.value.name
  private_dns         = var.private_dns
  resource_group_name = local.resource_group_name
  resource_id         = azurerm_purview_account.pva.id
  settings            = each.value
  subnet_id           = can(each.value.subnet_id) ? each.value.subnet_id : var.remote_objects.vnets[try(each.value.lz_key, var.client_config.landingzone_key)][each.value.vnet_key].subnets[each.value.subnet_key].id
}

# Requires azurerm >=2.92.0
module "managed_resources_private_endpoints" {
  source   = "../../networking/private_endpoint"
  for_each = try(var.settings.managed_resources_private_endpoints, {})

  base_tags           = var.base_tags
  tags                = local.tags
  client_config       = var.client_config
  global_settings     = var.global_settings
  location            = local.location
  name                = each.value.name
  private_dns         = var.private_dns
  resource_group_name = local.resource_group_name
  resource_id         = each.value.name == "eventhub" ? azurerm_purview_account.pva.managed_resources[0].event_hub_namespace_id : azurerm_purview_account.pva.managed_resources[0].storage_account_id
  settings            = each.value
  subnet_id           = var.remote_objects.vnets[try(each.value.lz_key, var.client_config.landingzone_key)][each.value.vnet_key].subnets[each.value.subnet_key].id
}
