terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.83.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
  credentials = file(var.serviceaccountjson)
}

resource "google_compute_firewall" "firewall" {
  name    = var.firewall_name
  network = var.network

  allow {
    protocol = var.protocol
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"] # Not So Secure. Limit the Source Range
  target_tags   = ["externalssh"]
}


resource "google_compute_instance" "dev" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = ["externalssh"]

  boot_disk {
    initialize_params {
      image = var.os_image
    }
  }

  network_interface {
    network = var.network


  access_config {

    }
}

  provisioner "remote-exec" {
    connection {
      host =         "${google_compute_instance.dev.network_interface.0.access_config.0.nat_ip}"
      type        = "ssh"
      user        =  var.user
      timeout     = "500s"
      private_key =  file(var.privatekeypath)
    }

    inline = [
      "sudo yum -y install epel-release",
      "sudo yum -y install curl",
      "sudo  curl 'http://metadata.google.internal/computeMetadata/v1/instance/' -H 'Metadata-Flavor: Google' > /tmp/metadataserverdetails.txt"
    ]
  }

  # Ensure firewall rule is provisioned before server, so that SSH doesn't fail.
  depends_on = [ google_compute_firewall.firewall]



  metadata = {
  ssh-keys = "${var.user}:${file(var.publickeypath)}"

}
}
