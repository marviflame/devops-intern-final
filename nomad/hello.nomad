job "hello-devops-service" {
  datacenters = ["dc1"]
  type        = "service"

  group "hello" {
    count = 1

    task "hello" {
      driver = "docker"

      config {
        image = "hello-devops:1.0"
      }

      resources {
        cpu    = 100
        memory = 128
      }

      restart {
        attempts = 3
        interval = "10m"
        delay    = "15s"
        mode     = "delay"
      }
    }
  }
}