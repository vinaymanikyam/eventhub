provider "azurerm" {
  features {}
}
module "event_hub_namespace" {
  #source               = "../modules/azurerm/Event_hub/eventhub_namespace"
  source                 = "C:/Users/USER/Desktop/Event-hub/eventhub_namespace"
  location               = var.location
  resource_group_name    = var.resource_group_name
  event_hub_namespace    = var.event_hub_namespace
  event_hub_tags         = var.event_hub_tags
  dr_location            = var.dr_location
  dr_resource_group_name = var.dr_resource_group_name
}