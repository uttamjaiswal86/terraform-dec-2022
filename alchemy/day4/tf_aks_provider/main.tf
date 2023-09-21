provider "kubernetes" {
	config_path = "~/.kube/config"
}

resource "kubernetes_pod" "admaticpod" {
	metadata {
		name = "admatic-new-aks-pod"
	}

	spec {
		container {
		  image = "nginx"
		  name = "web"
		  port {
			container_port = 80
		  }
		}
	}


}

resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "scalable-nginx-example"
    labels = {
      App = "ScalableNginxExample"
    }
  }

  spec {
    replicas = 6
    selector {
      match_labels = {
        App = "ScalableNginxExample"
      }
    }
    template {
      metadata {
        labels = {
          App = "ScalableNginxExample"
        }
      }
      spec {
        container {
          image = "nginx:1.7.8"
          name  = "example"

          port {
            container_port = 80
          }

        }
      }
    }
  }
}

resource "kubernetes_service" "nginx" {
  metadata {
    name = "nginx-example"
  }
  spec {
    selector = {
      App = "ScalableNginxExample"
    }
    port {
      port        = 80
      target_port = 80
    }

    #type = "ClusterIP"
    type = "LoadBalancer"
  }
}
