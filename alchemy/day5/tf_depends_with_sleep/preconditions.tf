resource "time_sleep" "wait_3_mins" {
  depends_on = [azurerm_public_ip.myterraformpublicip]
  create_duration = "3m"
}


resource "null_resource" "pipcheck" {
  triggers = {
        trigger = timestamp()
  }
  lifecycle {
    precondition {
      condition = azurerm_public_ip.myterraformpublicip.ip_address != ""
      error_message = "Public Ip must not be empty"
    }
  }
  depends_on = [time_sleep.wait_3_mins]
}
