data "azurerm_servicebus_namespace" "example" {
  name                    = var.service_bus_namespace_name
  resource_group_name     = var.service_bus_resource_group_name
}

resource "azurerm_servicebus_queue" "servicebus_outbound_message_queue" {
  for_each                              = {for queue in var.queues: queue.name => queue}

  namespace_name                        = var.service_bus_namespace_name
  resource_group_name                   = var.service_bus_resource_group_name
  name                                  = each.value.name
  lock_duration                         = each.value.lock_duration
  dead_lettering_on_message_expiration  = each.value.dead_lettering_on_message_expiration
}

module "servicebus_topics" {
  source = "./service_bus_topic"
  for_each                              = {for topic in var.topics: topic.name => topic}

  service_bus_namespace_name              = var.service_bus_namespace_name
  service_bus_resource_group_name         = var.service_bus_resource_group_name
  topic_name                              = each.value.name
  requires_duplicate_detection            = each.value.requires_duplicate_detection
  duplicate_detection_history_time_window = each.value.duplicate_detection_history_time_window
  subscriptions                           = each.value.subscriptions
}