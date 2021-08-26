resource "azurerm_servicebus_subscription" "servicebus_outbound_message_subscription" {
  resource_group_name                   = var.service_bus_resource_group_name
  namespace_name                        = var.service_bus_namespace_name
  topic_name                            = var.topic_name
  name                                  = var.subscription_name
  max_delivery_count                    = var.subscription_max_delivery_count
}

resource "azurerm_servicebus_subscription_rule" "servicebus_outbound_message_rule" {
  for_each                              = {for rule in var.subscription_rules: rule.name => rule}
  
  resource_group_name                   = var.service_bus_resource_group_name
  namespace_name                        = var.service_bus_namespace_name
  topic_name                            = var.topic_name
  subscription_name                     = var.subscription_name
  name                                  = each.value.name
  filter_type                           = each.value.filter_type
  sql_filter                            = each.value.sql_filter

  depends_on                              = [
    azurerm_servicebus_subscription.servicebus_outbound_message_subscription
  ]
}