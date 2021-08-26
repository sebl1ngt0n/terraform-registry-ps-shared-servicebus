variable service_bus_namespace_name { 
    type            = string 
    description     = "The Service Bus Namespace"
}

variable service_bus_resource_group_name { 
    type            = string 
    description     = "The Service Bus Namespace Resource Group Name"
}

variable topic_name { 
    type            = string 
    description     = "The Service Bus Topic Name"
}

variable requires_duplicate_detection {               
    type            = bool
    description     = "The Service Bus Topic Name"
}

variable duplicate_detection_history_time_window {
    type            = string
    description     = "The Service Bus Topic Name"
}

variable subscriptions {
    type            = list(object({        
        name                   = string
        max_delivery_count     = number
        rules                  = list(object({
            name                     = string
            filter_type              = string
            sql_filter               = string
        }))
    }))
    default         = []
}