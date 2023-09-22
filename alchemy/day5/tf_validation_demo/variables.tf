/*
variable "location" {
description = "used to mention the RG location"
default = "eastus"
}



variable "suffix" {

  description = "numerical suffix for rg "
  #type = number
  validation {
    condtion = length(var.suffix) > 3
    error_message = "Give atleast a 4 digit value"
  }
}
*/
/*
variable "location" {
        description = "used to mention the resourc group location"
        default = "westus"
}
*/
variable "suffix" {
  description = "numerical suffix for rg"
  #default = 12345
  validation {
    condition = length(var.suffix) > 3
    error_message = "give atleast a 4 digit numeric value"

  }
}

variable "environment" {
  description = "The environment short name to use for the deployed resources."
  validation {
    condition     = can(regex("^dev$|^uat$|^prd$", var.environment))
    error_message = "invalid env name"
  }
}

variable "location" {
  description = "Input your CSP location"
  validation {
  condition = can(regex("^eastus$|^westus$", var.location))
  error_message = "Only works in eastus or westus region"
  }
}
