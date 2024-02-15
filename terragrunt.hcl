#remote_state {
#    backend = "azurerm"
#    config = {
#        resource_group_name = ""
#        storage_account_name = ""
#        container_name = ""
#        key = "as***.tfstate"
##    }
#}

inputs = {
    location = "eastus"
    resource_group_name = "azureservicebus"
    services_bus_namespace_name = "asbsApp1"
    messages_queue_name         = "app1MessagesQueue"
    messages_error_queue_name   = "app1MessagesErrorQueue"
    environment = "dev"
    messages_auth_reader = "app1MessagesReader"
    messages_auth_writer = "app1MessagesWriter"
    messages_auth_err_writer = "app1ErrorMessagesWriter"
 }

