provider "azurerm" {
  features {}
}
module "event_hub" {
  #source               = "../modules/azurerm/Event_hub/eventhub"
  source              = "C:/Users/USER/Desktop/Event-hub/eventhub"
  resource_group_name = var.resource_group_name
  event_hub           = var.event_hub
  namespace_name      = var.namespace_name
}