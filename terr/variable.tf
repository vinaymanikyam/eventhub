# resource group common vars
variable "rg_name" {
  type        = string
  description = "Resource group name"
  default     = ""
}

variable "rg_location" {
  type        = string
  description = "The Azure Region"
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}

variable "virtual_network_name" {}
variable "vnet_address_space" {}
variable "subnet_name" {}
variable "subnet_address_prefix" {}
variable "event_hub_namespace" {}
variable "eventhub_authorization_rule_name" {}
variable "event_hub" {

}