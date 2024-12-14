variable "enable_vm" {
  type        = bool
  default     = false
  description = "Enable <vm_config> module or not"
}

variable "location" {
  default     = ""
  description = "Azure region location"
}

variable "img_publisher" {
  default     = "Canonical"
  description = "Azure platform image publisher"
}

variable "img_offer" {
  default = "0001-com-ubuntu-server-focal"
}

variable "img_sku" {
  default = "20_04-lts"
}

variable "vm_cnt" {
  type        = number
  default     = 2
  description = "Virtual Machine count"
}

variable "vm_name" {
  type        = string
  default     = "azure-vm"
  description = "Name of Azure RM virtual machine"
}

variable "rg_name" {
  default     = ""
  description = "Resource Group name"
}

variable "vm_size" {
  type    = string
  default = "Standard_B2s"
}

variable "admin_uname" {
  default     = "azureuser"
  description = "VM admin username"
}

variable "net_interface_ids" {
  type        = list(string)
  description = "Network interface ids list"
}

variable "os_disk_caching" {
  default     = "ReadWrite"
  description = "VM os_disk caching"
}

variable "os_disk_sa" {
  default     = "Standard_LRS"
  description = "OS disk storage account type"
}
