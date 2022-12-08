module "create-azure-vms" {
  source="./child-module/"
  child_module_vm_count = var.root_module_vm_count
}
