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

variable subscription_name { 
    type            = string 
    description     = "The Service Bus Subscription Name"
}

variable subscription_max_delivery_count { 
    type            = number 
    description     = "The Service Bus Subscription Max Delivery Count"
}

variable subscription_rules {
    type            = list(object({
        name                     = string
        filter_type              = string
        sql_filter               = string
    }))
    default         = []
    description     = "The Service Bus Subscription Rules"
}