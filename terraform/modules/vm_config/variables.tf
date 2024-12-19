variable "location" {
  type        = string
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

variable "pub_vm_cnt" {
  type        = number
  default     = 2
  description = "Virtual Machine count"
}

variable "priv_vm_cnt" {
  type        = number
  default     = 0
  description = "Virtual Machine count in Private-subnet"
}

variable "pub_vm_name" {
  type        = string
  default     = "azure-pub-vm"
  description = "Name of Azure RM virtual machine"
}

variable "priv_vm_name" {
  type        = string
  default     = "azure-priv-vm"
  description = "Name of Azure RM virtual machine in Private-subnet"
}

variable "rg_name" {
  type        = string
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

variable "ssh_key_file" {
  default     = "~/.ssh/id_rsa.pub"
  description = "Path of SSH public-key file"
}

variable "net_interface_ids" {
  type        = list(string)
  description = "Network interface ids list"
}

variable "net_interface_ids_priv" {
  type        = list(string)
  description = "Network interface ids(for private) list"
}

variable "os_disk_caching" {
  default     = "ReadWrite"
  description = "VM os_disk caching"
}

variable "os_disk_sa" {
  default     = "Standard_LRS"
  description = "OS disk storage account type"
}

