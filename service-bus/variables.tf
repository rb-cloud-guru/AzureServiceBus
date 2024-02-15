#region
variable location {
    description = "region"
}

#rg name
variable resource_group_name {
    description = "Resource Group Name"
}

#asb Namespace 
variable services_bus_namespace_name {
    description = "asb NameSpace"
}

#asb queue name
variable messages_queue_name {
    description = "asb Queue Name"
}

#asb queue error name
variable messages_error_queue_name {
    description = "asb Queue with errors Name"
}

#asb message expiration time
variable message_expiration_time {
  type        = map(string)
  description = "Message auto expiration time"
  default = {
    dev = "PT30S"
    qa  = "PT30S"
    hlg = "PT30S"
    prd = "PT3600S"
  }
}

#asb environment
variable environment {
    description = "asb environment location"
} 

#asb auth reader
variable messages_auth_reader {
    description = "asb messages auth reader "
}

#asb auth writer
variable messages_auth_writer {
    description = "asb message auth writer"
}

# asb auth messages error writer
variable messages_auth_err_writer {
    description = "asb message auth error writer"
}

