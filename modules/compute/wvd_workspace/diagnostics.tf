
module "diagnostics" {
  source   = "../../diagnostics"
  for_each = var.diagnostic_profiles == null ? toset([]) : toset(["enabled"])

  resource_id       = azurerm_virtual_desktop_workspace.wvdws.id
  resource_location = local.location
  diagnostics       = var.diagnostics
  profiles          = var.diagnostic_profiles
}