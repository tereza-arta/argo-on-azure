variable "enable_net" {
  type = bool
  default = "false"
  description = "Enable current module or not"
}

variable "rg_name" {
  default     = "rg-example"
  description = "Resource group name"
}

variable "az_region" {
  default     = "North Europe"
  description = "Azure region"
}

variable "virtual_net" {
  default = "vnet"
  description = "Virtual network name"
}

variable "addr_range" {
  type= list(string)
  default = ["10.0.0.0/16"]
  description = "Virtual network address-space"
}

variable "subnet" {
  default = "Public-subnet"
  description = "Public-subnet name"
}

variable "sub-addr-prefix" {
  default = "10.0.1.0/24"
  description = "Cidr of public subnet"
}

variable "pub_ip_cnt" {
  type        = number
  default     = 2
  description = "Count of public ip"
}

variable "pub_ip_alloc_method" {
  default = "Static"
  description = "Public IP allocation method"
}

variable "ip_sku" {
  default = "Basic"
}

variable "nat_name" {
  default = "For-priv-sub"
}

variable "nic_cnt" {
  type        = number
  default     = 2
  description = "Count of Network Interface"
}

variable "priv_ip_alloc" {
  default     = "Dynamic"
  description = "Net interface priv ip allocation method"
}
