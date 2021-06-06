resource "kubernetes_deployment" "external-deployment" {
  metadata {
    name = "external-deployment"
    labels = {
      App = "capstone-arun-external"
    }
    namespace = kubernetes_namespace.n.metadata[0].name
  }

  spec {
    replicas                  = 2
    
    selector {
      match_labels = {
        App = "capstone-arun-external"
      }
    }
    template {
      metadata {
        labels = {
          App = "capstone-arun-external"
        }
      }
      spec {
        container {
          image = "inbox2arun/external:1.0"
          name  = "capstone-external"

          port {
            container_port = 80
          }

          env {
            name   = "SERVER"
            value  = "http://capstone-internal-service:8082"
          }

                    }
        }
      }
    }
  }
