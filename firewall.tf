resource "google_compute_firewall" "tf-allow-ports" {
    name = sureshindrala1
    network = default
    dynamic "allow" {
        for_each = var.ports
        content {
          protocol = "tcp"
          ports = [allow.value]
        }
    }
    source_ranges = ["0.0.0.0/0"]
  
}