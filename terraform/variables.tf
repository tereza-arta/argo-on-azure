variable "pub_ip_cnt" {
  type        = number
  default     = 2
  description = "Count of vm public ip"
}

variable "nic_cnt" {
  type        = number
  default     = 2
  description = "Count of Network Interface"
}

vaiable "ass_cnt" {
  type        = number
  default     = 2
  description = "NSG-NI-association resource count"
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

variable "vm_size" {
  type    = string
  default = "Standard_B2s"
}
