variable "viuser" {
   default = "lpadmin@vsphere.local"
}
variable "vipassword" {
   default = "4l+1li-6@nYaM"
}
variable "viserver" {
  default = "192.168.189.17"
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
