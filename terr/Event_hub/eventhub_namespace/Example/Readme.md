# Create Event Hub Namespace in Azure

This Module allows you to create and manage one Event Hub Namespace in Microsoft Azure.

## Features

This module will:

- Create one Event Hub Namespace in Microsoft Azure.

## Usage

```hcl
module "eventhub_namespace" {
    source                                = "../modules/azurerm/Event_hub/eventhub_namespace"
    resource_group_name                   = module.BaseInfrastructure.resource_group_name
    location                              = module.BaseInfrastructure.location
    event_hub_namespace                   = var.event_hub_namespace
    event_hub_tags                        = var.event_hub_tags
}
```

## Example

Please refer Example directory to consume this module into your application.

- [main.tf](./main.tf) file calls the resource group module.
- [var.tf](./var.tf) contains declaration of terraform variables which are passed to the resource group module.
- [values.auto.tfvars](./values.auto.tfvars) contains the variable defination or actual values for respective variables which are passed to the resource group module.
