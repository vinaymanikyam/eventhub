# Eventhub common vars

variable "resource_group_name" {
  description = "The name of the resource group that will contain the resources."
  type        = string
  default     = ""
}

variable "event_hub_name" {
  description = "Specifies the name of the EventHub resource."
  type        = string
  default     = ""
}

variable "namespace_name" {
  description = "Specifies the name of the EventHub namespace"
  type        = string
  default     = ""
}

variable "partition_count" {
  description = "Specifies the current number of shards on the Event Hub."
  type        = number
  default     = 1
}

variable "message_retention" {
  description = "Specifies the number of days to retain the events for this Event Hub."
  type        = number
  default     = 1
}

## capture_description vars
variable "capture_description" {
  description = "Specifies network_rulesets"
  default     = {}
  type = map(object({
    enabled             = string
    encoding            = bool
    interval_in_seconds = string
    size_limit_in_bytes = string
    skip_empty_archives = string
    destination = list(object({
      name                = string
      archive_name_format = string
      blob_container_name = string
      storage_account_id  = string
    }))
  }))
}


## Eventhub custom group vars

variable "create_custom_eventhub_group" {
  description = "condition to create eventhub custom group"
  type        = bool
  default     = false
}

variable "eventhub_consumer_group" {
  description = "Specifies the name of the consumer group of the Event Hub namespace."
  type        = string
  default     = ""
}

variable "user_metadata" {
  description = "Specifies the user metadata."
  type        = number
  default     = 0
}


## Azure Eventhub authorization rule

variable "create_eventhub_authorization_rule" {
  description = "condition to create eventhub authorization_rule"
  type        = bool
  default     = false
}

variable "eventhub_ns_authorization_rule_name" {
  description = "name of the namespace_authorization_rule"
  type        = string
  default     = ""
}
variable "eventhub_authorization_rule_listen" {
  description = "Grants listen access to Authorization Rule of the Event Hub namespace"
  type        = bool
  default     = true
}

variable "eventhub_authorization_rule_send" {
  description = "Grants send access to Authorization Rule of the Event Hub namespace"
  type        = bool
  default     = true
}

variable "eventhub_authorization_rule_manage" {
  description = "Grants manage access to Authorization Rule of the Event Hub namespace"
  type        = bool
  default     = true
}