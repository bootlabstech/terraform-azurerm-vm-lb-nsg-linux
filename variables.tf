variable "resource_group_name" {
  type        = string
  description = "name of the resource group"
}

variable "location" {
  type        = string
  description = "location of the resource group"
}
# Virtual Machine
variable "name" {
  type        = string
  description = "Specifies the name of the Virtual Machine. Changing this forces a new resource to be created."
}

variable "vm_size" {
  type        = string
  description = "Specifies the size of the Virtual Machine. See also Azure VM Naming Conventions."
}
variable "delete_os_disk_on_termination" {
  type        = bool
  description = " Should the OS {{.name}} (either the Managed {{.name}} / VHD Blob) be deleted when the Virtual Machine is destroyed? Defaults to false."
  default     = true
}

variable "delete_data_disks_on_termination" {
  type        = bool
  description = "Should the Data {{.name}}s (either the Managed {{.name}}s / VHD Blobs) be deleted when the Virtual Machine is destroyed? Defaults to false."
  default     = true
}
variable "disable_password_authentication" {
  type        = bool
  description = "Specifies whether password authentication should be disabled. If set to false, an admin_password must be specified."
  default     = false
}

variable "timezone" {
  type        = string
  description = "(optional) describe your variable"
  default     = "India Standard Time"
}

# storage_image_reference
variable "publisher" {
  type        = string
  description = " Specifies the publisher of the image used to create the virtual machine. Examples: Canonical, MicrosoftWindowsServer"
  default = "Canonical"
}

variable "offer" {
  type        = string
  description = "Specifies the offer of the image used to create the virtual machine. Examples: UbuntuServer, WindowsServer"
}

variable "sku" {
  type        = string
  description = "Specifies the SKU of the image used to create the virtual machine. Examples: 18.04-LTS, 2019-Datacenter"
}

variable "storage_image_version" {
  type        = string
  description = "Specifies the version of the image used to create the virtual machine. Changing this forces a new resource to be created."
}


# storage_os_{{.name}}
variable "caching" {
  type        = string
  description = "Specifies the caching requirements for the Data {{.name}}. Possible values include None, ReadOnly and ReadWrite."
  default     = "ReadWrite"
}

variable "create_option" {
  type        = string
  description = "Specifies how the data {{.name}} should be created. Possible values are Attach, FromImage and Empty."
  default     = "FromImage"
}

variable "managed_disk_type" {
  type        = string
  description = "Specifies the type of managed disk to create. Possible values are either Standard_LRS, StandardSSD_LRS, Premium_LRS or UltraSSD_LRS."
  default = "Standard_LRS"
}

variable "os_type" {
  type        = string
  description = "Specifies the Operating System on the OS {{.name}}. Possible values are Linux and Windows."
  default = "Linux"
}

# os_profile
variable "admin_username" {
  type        = string
  description = "Specifies the name of the local administrator account."
}

variable "admin_password" {
  type        = string
  description = "The password associated with the local administrator account."
}

variable "custom_data" {
  type        = string
  description = "Specifies custom data to supply to the machine. On Linux-based systems, this can be used as a cloud-init script."
}

# azurerm_network_interface
variable "ip_name" {
  type        = string
  description = "A name used for this IP Configuration."
  default     = "internal"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the Subnet where this Network Interface should be located in."
}

variable "private_ip_address_allocation" {
  type        = string
  description = "The allocation method used for the Private IP Address. Possible values are Dynamic and Static"
  default = "Dynamic"
}
# azurerm_network_security_rule
variable "nsg_rules" {
  type = map(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_address_prefix      = string
    source_port_range          = string
    destination_address_prefix = string
    destination_port_range     = string
  }))
  default = {
    "https" = {
      access                     = "Allow"
      destination_address_prefix = "*"
      destination_port_range     = "443"
      direction                  = "Inbound"
      name                       = "allow-https"
      priority                   = 100
      protocol                   = "Tcp"
      source_address_prefix      = "*"
      source_port_range          = "*"
    }
  }
}
# azurerm_recovery_services_vault
variable "recovery_services_vault_name" {
  type        = string
  description = "name of the azurerm_network_security_group"
}
variable "services_vault_resource_group_name" {
  type        = string
  description = "name of the azurerm_network_security_group"
}



//load_balancer 

variable "ip_version" {
  type        = string
  description = "The IP Version to use"
  default     = "IPv4"
}

variable "public_ip_sku" {
  description = "The SKU Tier that should be used for the Public IP. Possible values are Regional and Global"
  type        = string
  default     = "Standard"
}

variable "public_ip_sku_tier" {
  description = "The SKU Tier that should be used for the Public IP. Possible values are Regional and Global, NOTE ---- When sku_tier is set to Global, sku must be set to Standard"
  type        = string
  default     = "Regional"
}

variable "allocation_method" {
  type        = string
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic"
  default     = "Static"
}

variable "lb_sku" {
  type        = string
  description = "The SKU of the Azure Load Balancer. Accepted values are Basic, Standard and Gateway. Defaults to Basic"
  default     = "Standard"
}

variable "lb_sku_tier" {
  type        = string
  description = "The SKU tier of this Load Balancer. Possible values are Global and Regional. Defaults to Regional"
  default     = "Regional"
}

variable "probe_ports" {
  type        = number
  description = "(optional) describe your variable"
  default     = "443"
}