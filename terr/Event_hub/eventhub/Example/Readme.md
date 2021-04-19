# Create Event Hub in Azure

This Module allows you to create and manage one Event Hub in Microsoft Azure.

## Features

This module will:

- Create one Event Hub in Microsoft Azure.

## Usage

```hcl
module "eventhub" {
    source                                = "../modules/azurerm/Event_hub/eventhub"
    resource_group_name                   = module.BaseInfrastructure.resource_group_name
    location                              = module.BaseInfrastructure.location
    eventhub_name                         = var.event_hub
    event_hub                             = var.event_hub
    namespace_name                        = var.namespace_name
}
```

## Example

Please refer Example directory to consume this module into your application.

- [main.tf](./main.tf) file calls the resource group module.
- [var.tf](./var.tf) contains declaration of terraform variables which are passed to the resource group module.
- [values.auto.tfvars](./values.auto.tfvars) contains the variable defination or actual values for respective variables which are passed to the resource group module.
