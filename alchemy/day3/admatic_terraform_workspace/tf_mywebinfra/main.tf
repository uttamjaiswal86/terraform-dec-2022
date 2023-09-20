module "azure_linuxvm" {
  source = "../modules/azure_linuxvm"
  location = "eastus"
  rgsuffix = "fromAlchTrainingD3"
  ssh_user = var.sshuname
  ssh_port = var.ssh_port
  depends_on = [module.azure_storage,random_string.rs2]
}

module "azure_storage" {
  source = "../modules/azure_storage"
  scontainer = "scontainerujais86"
  location = "eastus"
  rgroup = "rgstoreujais86"
  saname = "sanameujais86"
}

resource "random_string" "rs2" {
  length = "9"
}
