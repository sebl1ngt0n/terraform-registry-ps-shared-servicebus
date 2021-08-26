variable service_bus_namespace_name { 
    type            = string 
    description     = "The Service Bus Namespace"
}

variable service_bus_resource_group_name { 
    type            = string 
    description     = "The Service Bus Namespace Resource Group Name"
}

variable queues {
    type = list(object({
        name                                    = string
        lock_duration                           = string
        dead_lettering_on_message_expiration    = bool
    }))
    description     = "Queues to create within Service Bus Namespace"
    default         = []
}

variable topics {
    type = list(object({
        name                                        = string
        requires_duplicate_detection                = bool
        duplicate_detection_history_time_window     = string
        subscriptions                               = list(object({        
            name                   = string
            max_delivery_count     = number
            rules                  = list(object({
                name                     = string
                filter_type              = string
                sql_filter               = string
            }))
        }))
    }))
    description     = "Topics to create within Service Bus Namespace"
    default         = []
}