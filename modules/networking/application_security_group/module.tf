resource "azurecaf_name" "asg" {
  name          = var.settings.name
  resource_type = "azurerm_application_security_group"
  prefixes      = var.global_settings.prefixes
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
  use_slug      = var.global_settings.use_slug
}

resource "azurerm_application_security_group" "asg" {
  name                = azurecaf_name.asg.result
  location            = local.location
  resource_group_name = local.resource_group_name
  tags                = merge(local.tags, try(var.settings.tags, {}))
}


