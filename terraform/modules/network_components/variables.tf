variable "rg_cnt" {
  type        = number
  default     = 1
  description = "Resource Group count"
}

variable "rg_name" {
  default     = "rg-example"
  description = "Resource group name"
}

variable "az_region" {
  type        = list(string)
  default     = ["North Europe", "France Central", "East US"]
  description = "Azure Region"
}

variable "reg_index" {
  type        = number
  default     = 0
  description = "Index of listed Azure Regions"
}

variable "vnet_cnt" {
  type        = number
  default     = 1
  description = "Virtual Network count"
}

variable "vnet_name" {
  default     = "vnet"
  description = "Virtual network name"
}

variable "addr_range" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
  description = "Virtual network address-space"
}

variable "vnet_addr_ind" {
  type        = number
  default     = 0
  description = "Index of Virtual Network address range"
}

variable "pub-sub-cnt" {
  type        = number
  default     = 1
  description = "Count of public-subnet"
}

variable "priv-sub-cnt" {
  type        = number
  default     = 0
  description = "Count of private-subnet"
}

variable "pub-sub-name" {
  default     = "Public-subnet"
  description = "Public-subnet name"
}

variable "priv-sub-name" {
  default     = "Private-subnet"
  description = "Private-subnet name"
}

variable "pub-sub-addr-prefix" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "Cidr of public subnet"
}

variable "priv-sub-addr-prefix" {
  type        = list(string)
  default     = ["10.0.3.0/24"]
  description = "Cidr of private subnet"
}

variable "rg_index" {
  type        = number
  default     = 0
  description = "Index of existing Resource-group"
}

variable "dynamic_ip" {
  type        = number
  default     = 0
  description = "Count of Dynamic Public-ip"
}

variable "static_ip" {
  type        = number
  default     = 2
  description = "Count of Static Public-ip"
}

variable "ip_alloc_method" {
  type        = list(string)
  default     = ["Static", "Dynamic"]
  description = "Public IP allocation method"
}

variable "ip_sku_basic" {
  type        = number
  default     = 1
  description = "Count of Public-ip Basic Sku"
}

variable "ip_sku_std" {
  type        = number
  default     = 0
  description = "Count of Public-ip Standard Sku"
}

variable "pub_nic_cnt" {
  type        = number
  default     = 2
  description = "Count of Network Interface for public subnets"
}

variable "priv_nic_cnt" {
  type        = number
  default     = 0
  description = "Count of Network Interface for private subnets"
}

variable "ip_cgf_name" {
  default     = "ig-config"
  description = "Ip-configuration name"
}

variable "pub_sub_index" {
  type        = number
  default     = 0
  description = "Index of existing Public-subnet"
}

variable "priv_sub_index" {
  type        = number
  default     = 0
  description = "Index of existing Private-subnet"
}

variable "priv_ip_alloc" {
  type        = list(string)
  default     = ["Dynamic", "Static"]
  description = "List of private-ip-allocation methods"
}

variable "priv_ip_alloc_ind" {
  type        = number
  default     = 0
  description = "Index of private-ip-allocation preferred method"
}

variable "nat_cnt" {
  type        = number
  default     = 0
  description = "Count of NAT-Gateway"
}

variable "nat_name" {
  default = "For-priv-sub"
}

variable "nat_idle_out" {
  type        = number
  default     = 10
  description = "Idle_timeout in minutes"
}

variable "nat_sub_ass_cnt" {
  type        = number
  default     = 0
  description = "Count of private-subnet and nat-gateway association"
}

