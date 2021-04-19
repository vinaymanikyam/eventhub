# Event hub common vars
variable "location" {
  description = "The location of the resources."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "The name of the resource group that will contain the resources."
  type        = string
  default     = ""
}

# Event hub namespace vars
variable "event_hub_namespace" {
  description = "Specifies the name of the EventHub Namespace resource."
  type        = string
  default     = ""
}

variable "sku" {
  description = "Defines which tier to use. Valid options are Basic and Standard"
  default     = "Standard"
}

variable "capacity" {
  description = "Specifies the Capacity / Throughput Units for a Standard SKU namespace. Valid values range from 1 - 20"
  type        = number
  default     = "1"
}

variable "auto_inflate_enabled" {
  description = "Is Auto Inflate enabled for the EventHub Namespace?"
  type        = bool
  default     = false
}

variable "dedicated_cluster_id" {
  description = "Specifies the ID of the EventHub Dedicated Cluster where this Namespace should created."
  default     = null
}

variable "maximum_throughput_units" {
  description = "Specifies the maximum number of throughput units when Auto Inflate is Enabled. Valid values range from 1 - 20"
  type        = number
  default     = 1
}

variable "zone_redundant" {
  description = "Specifies if the EventHub Namespace should be Zone Redundant (created across Availability Zones)."
  type        = bool
  default     = false
}

# network_rulesets config vars
variable "network_rulesets" {
  description = "Specifies network_rulesets"
  default     = {}
  type = map(object({
    default_action                 = string
    trusted_service_access_enabled = bool
    virtual_network_rule = list(object({
      subnet_id                                       = string
      ignore_missing_virtual_network_service_endpoint = string
    }))
    ip_rule = list(object({
      ip_mask = string
      action  = string
    }))
  }))
}

variable "identity_type" {
  description = "The Type of Identity which should be used for this EventHub Namespace. At this time the only possible value is SystemAssigned"
  default     = "SystemAssigned"
}

variable "event_hub_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}

## Eventhub Secondary Namespace

variable "create_secondary_eventhub_ns" {
  description = "whether to secondary namespace for eventhub"
  type        = bool
  default     = false
}

variable "dr_location" {
  description = "The location of DR resources."
  type        = string
  default     = ""
}

variable "dr_resource_group_name" {
  description = "The name of the DR resource group that will contain the resources."
  type        = string
  default     = ""
}


## Eventhub dr config vars

variable "enable_dr_for_enventhub_ns" {
  description = "whether to enbled disaster recovery for eventhub namespace"
  type        = bool
  default     = false
}

variable "dr_config_name" {
  description = "Specifies the name of the EventHub Namespace config "
  type        = string
  default     = ""
}

variable "alternate_name" {
  description = "The name of the EventHub Namespace to replicate to., if primary and secondary have same namespace name"
  type        = string
  default     = null
}

## Azure Eventhub authorization rule

variable "create_eventhub_ns_authorization_rule" {
  description = "condition to create eventhub ns authorization_rule"
  type        = bool
  default     = false
}

variable "eventhub_authorization_rule_name" {
  description = "name of the eventhub authorization rule"
  type        = string
  default     = ""

}
variable "eventhub_ns_authorization_rule_listen" {
  description = "Grants listen access to Authorization Rule of the Event Hub namespace"
  type        = bool
  default     = true
}

variable "eventhub_ns_authorization_rule_send" {
  description = "Grants send access to Authorization Rule of the Event Hub namespace"
  type        = bool
  default     = true
}

variable "eventhub_ns_authorization_rule_manage" {
  description = "Grants manage access to Authorization Rule of the Event Hub namespace"
  type        = bool
  default     = true
}