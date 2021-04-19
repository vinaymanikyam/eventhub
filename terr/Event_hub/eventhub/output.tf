# Eventhub outputs
output "az_eventhub_id" {
  description = "Azure event hub ID"
  value       = azurerm_eventhub.az_event_hub.id
}

output "az_eventhub_name" {
  description = "Azure event hub name"
  value       = azurerm_eventhub.az_event_hub.name
}

# Eventhub custom group outputs
output "az_eventhub_consumer_group" {
  description = "Azure event hub consimer group ID"
  value       = element(concat(azurerm_eventhub_consumer_group.eventhub_cmg.*.id, [""]), 0)
}
