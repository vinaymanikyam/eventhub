# -
# - Azure Eventhub Namespace
# -
resource "azurerm_eventhub_namespace" "event_hub_namespace" {
  name                     = var.event_hub_namespace
  location                 = var.location
  resource_group_name      = var.resource_group_name
  sku                      = var.sku
  capacity                 = var.capacity
  auto_inflate_enabled     = var.auto_inflate_enabled
  dedicated_cluster_id     = var.dedicated_cluster_id
  maximum_throughput_units = var.auto_inflate_enabled == true ? var.maximum_throughput_units : 0
  zone_redundant           = var.zone_redundant

  # network_rulesets config block
  dynamic "network_rulesets" {
    for_each = var.network_rulesets
    content {
      default_action = lookup(network_rulesets.value, "default_action", "Allow")
      dynamic "virtual_network_rule" {
        for_each = coalesce(network_rulesets.value.virtual_network_rule, [])
        content {
          subnet_id                                       = coalesce(virtual_network_rule.value.subnet_id, "")
          ignore_missing_virtual_network_service_endpoint = coalesce(virtual_network_rule.value.ignore_missing_virtual_network_service_endpoint, "")
        }
      }
      dynamic "ip_rule" {
        for_each = coalesce(network_rulesets.value.ip_rule, [])
        content {
          ip_mask = lookup(ip_rule.value.ip_mask, "")
          action  = lookup(ip_rule.value.action, "")
        }
      }
    }
  }
  identity {
    type = var.identity_type
  }

  tags = var.event_hub_tags
}

# -
# - Azure Eventhub authorization rule
# -
resource "azurerm_eventhub_namespace_authorization_rule" "eventhub_ns_az_rule" {
  count               = var.create_eventhub_ns_authorization_rule ? 1 : 0
  name                = var.eventhub_authorization_rule_name
  namespace_name      = azurerm_eventhub_namespace.event_hub_namespace.name
  resource_group_name = var.resource_group_name
  listen              = var.eventhub_ns_authorization_rule_listen
  send                = var.eventhub_ns_authorization_rule_send
  manage              = var.eventhub_ns_authorization_rule_manage
} 