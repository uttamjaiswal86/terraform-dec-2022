resource "azurerm_resource_group" "tektutor_resource_group" {
  name     = var.resource_group_name 
  location = var.location 
}

resource "azurerm_kubernetes_cluster" "my_aks"  {
  name = var.cluster_name

  resource_group_name = azurerm_resource_group.tektutor_resource_group.name
  location = azurerm_resource_group.tektutor_resource_group.location 

   dns_prefix = "tektutor"

   default_node_pool {
	name = "default"
        node_count = 3
        vm_size = "Standard_D2_V2"
   }

   identity {
      type = "SystemAssigned"
   }

   tags = {
      Environment = "Production"
   }
}
