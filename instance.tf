# SET YOUR VCENTER CONNECTION INFORMATION HERE
data "vsphere_datacenter" "Linkplus-Demo" {
}

resource "vsphere_folder" "openshift" {
  path          = "terraform-test-folder"
  type          = "vm"
  datacenter_id = "${data.vsphere_datacenter.Linkplus-Demo.id}"
}
# DEFINE YOUR RESOURCES HERE FOLLOWING THIS TEMPLATE, REPLACING VALUES AS REQUIRED
resource "vsphere_virtual_machine" "ocplatform" {
  count = "${length(var.vms) * length(var.count)}"
  name   = "${element(var.vms, count.index / length(var.count))}-${element(var.count, count.index)}"
  hostname = "${element(var.vms, count.index / length(var.count))}-${element(var.count, count.index)}"
  datacenter = "Linkplus-Demo"
  cluster    = "lpvmw-cls"
  folder = "${vsphere_folder.openshift.path}"
  vcpu   = 1
  memory = 1024
  domain = "linkplus.int"
  dns_servers = ["192.168.191.13"]

  network_interface {
    label = "dvPG_301_Demo1"
    ipv4_address = "192.168.191.${63 + count.index}"
    ipv4_prefix_length = "24"
    ipv4_gateway = "192.168.191.250"
  }

  disk {
    template = "OCP/openshift"
    datastore = "tpsw1_p1_d4"
    type = "thin"
  }
}

resource "vsphere_virtual_machine" "ocloadbalancer" {
  name = "${var.loadbalancer}"
  hostname = "${var.loadbalancer}"
  datacenter = "Linkplus-Demo"
  cluster    = "lpvmw-cls"
  folder = "${vsphere_folder.openshift.path}"
  vcpu   = 1
  memory = 1024
  domain = "linkplus.int"
  dns_servers = ["192.168.191.13"]


 network_interface {
  label = "dvPG_301_Demo1"
  ipv4_address = "192.168.191.173"
  ipv4_prefix_length = "24"
  ipv4_gateway = "192.168.191.250"
  }

 disk {
    template = "OCP/openshift"
    datastore = "tpsw1_p1_d4"
    type = "thin"
  }

 provisioner "local-exec" {
    command = "sleep 300; ansible-playbook -i /etc/ansible/hosts /usr/share/ansible/openshift-ansible/playbooks/byo/config.yml"
  }
}
