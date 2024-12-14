variable "enable_nsg" {
  type        = bool
  default     = false
  description = "Enable <security_group> module or not"
}

variable "nsg_name" {
  default     = "sg-example"
  description = "Network Security Group name"
}

variable "location" {
  default     = ""
  description = "Azure region location"
}

variable "rg_name" {
  default     = ""
  description = "Resource Group name"
}

variable "sg_rule_1_name" {
  default     = "Allow-port-22"
  description = "Name of NSG rule-1"
}

variable "sg_rule_2_name" {
  default     = "Allow-port-80"
  description = "Name of NSG rule-2"
}

variable "sg_rule_3_name" {
  default     = "Argo-app-nodeport"
  description = "Allow argo-app nodeport"
}

variable "sg_rule_4_name" {
  default     = "Base-app-nodeport"
  description = "Allow base-app nodeport"
}

variable "sg_rule_1_prt" {
  type        = number
  default     = 100
  description = "NSG rule-1 priority number"
}

variable "sg_rule_2_prt" {
  type        = number
  default     = 110
  description = "NSG rule-2 priority number"
}

variable "sg_rule_3_prt" {
  type        = number
  default     = 120
  description = "NSG rule-3 priority number"
}

variable "sg_rule_4_prt" {
  type        = number
  default     = 130
  description = "NSG rule-4 priority number"
}

variable "argo-app-nodeport" {
  type        = number
  default     = 30009
  description = "Argo app svc nodeport number"
}

variable "base-app-nodeport" {
  type        = number
  default     = 30008
  description = "Argo app svc nodeport number"
}

variable "sg_rule_type" {
  default = "Inbound"
}

variable "sg_rule_access" {
  default     = "Allow"
  description = "Allow or deny access"
}


variable "sg_rule_protocol" {
  default = "Tcp"
}

variable "sg_src_port_range" {
  default     = "*"
  description = "NSG rule source port range"
}

variable "addr_prefix" {
  default     = "*"
  description = "NSG src/dest address prefix"
}

variable "sg_dest_port_range" {
  default     = "22"
  description = "NSG rule destination port range"
}

variable "ass_cnt" {
  type        = number
  default     = 2
  description = "NSG-NI-association resource count"
}

variable "net_interface_ids" {
  type        = list(string)
  description = "Network interface ids list"
}
