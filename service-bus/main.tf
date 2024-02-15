
#tf
terraform {
  backend "azurerm" {}
}

#provider
provider "azurerm" {
	features {}
}

# Creates the queue
resource "azurerm_servicebus_namespace" "busNamespace" {
  name                = var.services_bus_namespace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Basic"

  tags = {
    environment = "staging"
  }
}

# Queue for regular messages
resource "azurerm_servicebus_queue" "app1MessagesQueue" {
  name                = var.messages_queue_name
  namespace_id = azurerm_servicebus_namespace.busNamespace.id
  max_size_in_megabytes = 1024
  enable_partitioning   = true
}

# Queue for messages that had errors
resource "azurerm_servicebus_queue" "app1MessagesErrorQueue" {
  name                = var.messages_error_queue_name
  namespace_id = azurerm_servicebus_namespace.busNamespace.id

  max_size_in_megabytes                = 1024
  enable_partitioning                  = true
  default_message_ttl                  = lookup(var.message_expiration_time, var.environment)
  dead_lettering_on_message_expiration = true
  forward_dead_lettered_messages_to    = azurerm_servicebus_queue.app1MessagesQueue.name
}

# Credentials for App1 message generator
resource "azurerm_servicebus_queue_authorization_rule" "app1MessagesWriter" {
  name                = var.messages_auth_writer
  queue_id             = azurerm_servicebus_queue.app1MessagesQueue.id
  listen = false
  send   = true
  manage = false
}

# Credentials for Azure Functions consumer
resource "azurerm_servicebus_queue_authorization_rule" "app1MessagesReader" {
  name                = var.messages_auth_reader
  queue_id             = azurerm_servicebus_queue.app1MessagesQueue.id
  listen = true
  send   = false
  manage = false
}

# Credentials for App1 message generator
resource "azurerm_servicebus_queue_authorization_rule" "app1ErrorMessagesWriter" {
  name                = var.messages_auth_err_writer
  queue_id             = azurerm_servicebus_queue.app1MessagesErrorQueue.id

  listen = false
  send   = true
  manage = false
}
