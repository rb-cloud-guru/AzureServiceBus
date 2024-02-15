#remote_state {
    backend = "azurerm"
    config = {
        resource_group_name = ""
        storage_account_name = ""
        container_name = ""
        key = "${path_relative_to_include()}/as***.tfstate"
    }
}

inputs = {
    location = "azureregion"
    resource_group_name = "azurerg"
    services_bus_namespace_name = "azureasb"
    messages_queue_name         = "azureasbq"
    messages_error_queue_name   = "azureasbq2"
    environment = "env"
    messages_auth_reader = "app1"
    messages_auth_writer = "app2"
    messages_auth_err_writer = "app1-2"
 }

