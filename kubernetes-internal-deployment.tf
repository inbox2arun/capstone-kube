resource "kubernetes_deployment" "internal-deployment" {
  metadata {
    name = "internal-deployment"
    labels = {
      App = "capstone-arun-internal"
    }
    namespace = kubernetes_namespace.n.metadata[0].name
  }

  spec {
    replicas                  = 2
    
    selector {
      match_labels = {
        App = "capstone-arun-internal"
      }
    }
    template {
      metadata {
        labels = {
          App = "capstone-arun-internal"
        }
      }
      spec {
        container {
          image = "inbox2arun/internal:1.0"
          name  = "capstone-internal"

          port {
            container_port = 8082
          }

                    }
        }
      }
    }
  }
