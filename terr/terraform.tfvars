rg_name                          = "test-rg"
rg_location                      = "eastus2"
virtual_network_name             = "test-vnet"
vnet_address_space               = ["10.0.0.0/24"]
subnet_name                      = "test-subnet"
subnet_address_prefix            = ["10.0.0.0/24"]
event_hub_namespace              = "test-evhns"
eventhub_authorization_rule_name = "RootManageSharedAccessKey"
event_hub                        = "test-evh"
tags = {
  env = "test"
}