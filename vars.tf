variable "viuser" {
   default = "vcenter_username"
}
variable "vipassword" {
   default = "vcenter_password"
}
variable "viserver" {
  default = "vcenter_password"
}

// default VM name in vSphere
variable "vms" {
  type = "list"
  default = ["ocmaster" , "ocnode", "ocinfra" ]
}

variable "count" {
  type = "list"
  default = ["1" , "2" , "3"]
}

variable "loadbalancer" {
 default = "oclb"
}
