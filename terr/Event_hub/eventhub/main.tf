# -
# - Azure Eventhub 
# -
resource "azurerm_eventhub" "az_event_hub" {
  name                = var.event_hub_name
  namespace_name      = var.namespace_name
  resource_group_name = var.resource_group_name
  partition_count     = var.partition_count
  message_retention   = var.message_retention

  # capture_description config block
  dynamic "capture_description" {
    for_each = var.capture_description == null ? null : var.capture_description
    content {
      enabled             = lookup(capture_description.value, "enabled", "Allow")
      encoding            = lookup(capture_description.value, "encoding", null)
      interval_in_seconds = lookup(capture_description.value, "interval_in_seconds", null)
      size_limit_in_bytes = lookup(capture_description.value, "size_limit_in_bytes", null)
      skip_empty_archives = lookup(capture_description.value, "skip_empty_archives", null)
      dynamic "destination" {
        for_each = coalesce(capture_description.value, "destination", [])
        content {
          name                = coalesce(capture_description.value, "name", "EventHubArchive.AzureBlockBlob")
          archive_name_format = coalesce(capture_description.value, "archive_name_format", "")
          blob_container_name = coalesce(capture_description.value, "blob_container_name", "")
          storage_account_id  = coalesce(capture_description.value, "storage_account_id", "")
        }
      }
    }
  }
}


# -
# - Azure Eventhub cmg
# -
resource "azurerm_eventhub_consumer_group" "eventhub_cmg" {
  count               = var.create_custom_eventhub_group ? 1 : 0
  name                = var.eventhub_consumer_group
  namespace_name      = var.namespace_name
  eventhub_name       = azurerm_eventhub.az_event_hub.name
  resource_group_name = var.resource_group_name
  #user_metadata       = var.user_metadata
}


# -
# - Azure Eventhub authorization rule
# -
resource "azurerm_eventhub_authorization_rule" "eventhub" {
  count               = var.create_eventhub_authorization_rule ? 1 : 0
  name                = var.eventhub_ns_authorization_rule_name
  namespace_name      = var.namespace_name
  eventhub_name       = azurerm_eventhub.az_event_hub.name
  resource_group_name = var.resource_group_name
  listen              = var.eventhub_authorization_rule_listen
  send                = var.eventhub_authorization_rule_send
  manage              = var.eventhub_authorization_rule_manage
}



