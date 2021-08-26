resource "azurerm_servicebus_topic" "servicebus_outbound_message_topic" {
  namespace_name                          = var.service_bus_namespace_name
  resource_group_name                     = var.service_bus_resource_group_name
  name                                    = var.topic_name
  requires_duplicate_detection            = var.requires_duplicate_detection
  duplicate_detection_history_time_window = var.duplicate_detection_history_time_window
}

module "servicebus_topic_subscriptions" {
  source = "../service_bus_topic_subscription"
  for_each                                = {for sub in var.subscriptions: sub.name => sub}

  service_bus_namespace_name              = var.service_bus_namespace_name
  service_bus_resource_group_name         = var.service_bus_resource_group_name
  topic_name                              = var.topic_name                      
  subscription_name                       = each.value.name
  subscription_max_delivery_count         = each.value.max_delivery_count
  subscription_rules                      = each.value.rules
 
  depends_on                              = [
    azurerm_servicebus_topic.servicebus_outbound_message_topic
  ]
}