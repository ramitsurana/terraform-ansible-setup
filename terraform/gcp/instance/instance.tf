variable "zone" 	     { default = "us-east1-b" }
variable "tags" 	     { default = ["sample", "sample1", "sample2"] }
variable "image" 	     { default = "ubuntu-1404-trusty-v20170703" }
variable "machine_type"      { default = "n1-standard-1" }

resource "google_compute_instance" "sample" {
    count = "${length(var.tags)}"
    name = "sample-${count.index+1}"
    machine_type = "${var.machine_type}"
    zone = "${var.zone}"
    tags = ["${var.tags[count.index]}"]

    disk = {
    image = "${var.image}"
    }

    network_interface {
      network = "default"
      access_config {
	// Ephemeral IP
      }
    }
}

resource "google_compute_address" "sample" {
    name = "tf-sample-address"
}

resource "google_compute_target_pool" "sample" {
  name = "tf-sample-target-pool"
  instances = ["${google_compute_instance.sample.*.self_link}"]
  health_checks = ["${google_compute_http_health_check.http.name}"]
}

resource "google_compute_forwarding_rule" "http" {
  name = "tf-sample-http-forwarding-rule"
  target = "${google_compute_target_pool.sample.self_link}"
  ip_address = "${google_compute_address.sample.address}"
  port_range = "80"
}

resource "google_compute_forwarding_rule" "tcp" {
  name = "tf-sample-tcp-forwarding-rule"
  target = "${google_compute_target_pool.sample.self_link}"
  ip_address = "${google_compute_address.sample.address}"
  port_range = "8080"
}

resource "google_compute_forwarding_rule" "https" {
  name = "tf-sample-https-forwarding-rule"
  target = "${google_compute_target_pool.sample.self_link}"
  ip_address = "${google_compute_address.sample.address}"
  port_range = "443"
}

resource "google_compute_http_health_check" "http" {
  name = "tf-sample-http-basic-check"
  request_path = "/"
  check_interval_sec = 1
  healthy_threshold = 1
  unhealthy_threshold = 10
  timeout_sec = 1
}

resource "google_compute_firewall" "sample" {
  name = "tf-sample-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["80", "443", "8080"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["sample-node"]
}
output "sample" {
  value = "${google_compute_instance.sample.public_ip}"
}
