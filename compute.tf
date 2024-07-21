resource "google_compute_instances" "tf-vm-instances" {
    for_each = var.instances
    name = each.key
    zone = var.geczone
    machine_type = each.value
    tags = [each.key]

    boot_disk {
        initialize_params {
            image = data.google_compute_image.ubuntu_image.self_link
            size = 10
            type = "pd-balence"
        }
    }
    network_interface {
        network = "default"
        accessconfig {
            network_tier = "PREMIUM"
        }
    }
    connection {
        type = "ssh"
        user = "sureshindrala1"
        host = self.network_interface[0].access_config[0].nat_ip
        private_key = file("ssh-key")
    }
    provisioner "file" {
        source = each.key == "ansible" ? "ansible.sh" : "empty.sh"
        destination = each.key == "ansible" ? "/home/sureshindrala1/ansible.sh" : "/home/sureshindrala1/empty.sh"

    }
    provisioner "remote-exec" {
        inline= [
            each.key == "ansible" ? "chmod +x /home/sureshindrala1/ansible.sh && sh /home/sureshindrala1/ansible.sh" : "echo 'skip the command'"
        ]
    }
    provisioner "file" {
        source = "ssh-key"
        destination = "/home/sureshindra1/ssh-key"
      
    }
}
data "google_compute_image" "ubuntu_image" {
    family = "ubuntu-2004-lts"
    project = "ubuntu-os-cloud"
  
}