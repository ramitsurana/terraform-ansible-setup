provider "google" {
    credentials = "${file("${var.account_file}")}"
    project = "${var.google_project_id}"
    region = "${var.region}"
}
