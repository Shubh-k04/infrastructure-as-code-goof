resource "google_container_cluster" "denied" {
  // Add a name for the cluster
  name = "my-cluster"

  // Add node configuration to ensure TLS is used to communicate with the API server
  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
    metadata = {
      disable-legacy-endpoints = "true"
    }
    service_account = "default"
    tls_cert_file = ""
    tls_private_key_file = ""
  }

  // Add network configuration to restrict access to the API server
  network_config {
    enable_private_nodes = true
    enable_private_endpoint = true
    master_ipv4_cidr_block = "172.16.0.0/28"
  }

  // Add a minimum version for the Kubernetes master and node software
  min_master_version = "1.21.0"
  min_node_version = "1.21.0"

  // Add a node pool to the cluster
  node_pool {
    name = "default-pool"
    node_count = 1
    version = "1.21.0-gke.1500"
    autoscaling {
      min_node_count = 1
      max_node_count = 3
    }
    management {
      auto_repair = true
      auto_upgrade = true
    }
    node_config {
      machine_type = "n1-standard-1"
      disk_size_gb = 100
      disk_type = "pd-standard"
    }
  }
}

resource "google_container_cluster" "denied_2" {
  // Add a name for the cluster
  name = "my-cluster-2"

  // Set issue_client_certificate to false to disable client certificate issuance
  master_auth {
    issue_client_certificate = false
  }

  // Add node configuration to ensure TLS is used to communicate with the API server
  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
    metadata = {
      disable-legacy-endpoints = "true"
    }
    service_account = "default"
    tls_cert_file = ""
    tls_private_key_file = ""
  }

  // Add network configuration to restrict access to the API server
  network_config {
    enable_private_nodes = true
    enable_private_endpoint = true
    master_ipv4_cidr_block = "172.16.0.16/28"
  }

  // Add a minimum version for the Kubernetes master and node software
  min_master_version = "1.21.0"
  min_node_version = "1.21.0"

  // Add a node pool to the cluster
  node_pool {
    name = "default-pool"
    node_count = 1
    version = "1.21.0-gke.1500"
    autoscaling {
      min_node_count = 1
      max_node_count = 3
    }
    management {
      auto_repair = true
      auto_upgrade = true
    }
    node_config {
      machine_type = "n1-standard-1"
      disk_size_gb = 100
      disk_type = "pd-standard"
    }
  }
}

resource "google_container_cluster" "denied_3" {   
