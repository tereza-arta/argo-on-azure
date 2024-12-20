//>>> Variables of the "network_components" module
variable "enable_net" {
  type        = bool
  default     = "true"
  description = "Enable current module or not"
}

variable "rg_cnt" {
  type        = number
  default     = 1
  description = "Resource Group count"
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

//>>> Variables of the "security_group" module
variable "enable_nsg" {
  type        = bool
  default     = "true"
  description = "Enable current module or not"
}

variable "nsg_cnt" {
  type    = number
  default = 1
}

variable "nsg_name" {
  default     = "sg-example"
  description = "Network Security Group name"
}

variable "inbound_cnt" {
  type        = number
  default     = 4
  description = "Count of NSG Inbound-rule"
}

variable "outbound_cnt" {
  type        = number
  default     = 0
  description = "Count of NSG Inbound-rule"
}

variable "rule_type_1" {
  default     = "Inbound"
  description = "Rule type - Inbound"
}

variable "rule_type_2" {
  default     = "Outbound"
  description = "Rule type - Inbound"
}

variable "rule_protocol" {
  default = "Tcp"
}

variable "src_port_range" {
  default     = "*"
  description = "NSG rule source port range"
}

variable "dest_port_range" {
  type        = list(number)
  default     = [22, 80, 30009, 30008]
  description = "List of NSG Inbound rules desination"
}

variable "out_dest_port_range" {
  type        = any
  default     = ["*"]
  description = "List of NSG Inbound rules desination"
}

variable "src_addr_prefix" {
  default     = "*"
  description = "NSG src/dest address prefix"
}

variable "dest_addr_prefix" {
  default     = "*"
  description = "NSG src/dest address prefix"
}

variable "sg_index" {
  type        = number
  default     = 0
  description = "Index of preferred NSG"
}

variable "ass_cnt" {
  type        = number
  default     = 2
  description = "NSG-NI-association resource count"
}

//>>> Variables of the "vm_config" module
variable "enable_vm" {
  type        = bool
  default     = "true"
  description = "Enable current module or not"
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

