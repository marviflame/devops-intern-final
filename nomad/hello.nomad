job "hello-devops" {
  datacenters = ["dc1"]
  type        = "batch"

  group "hello" {
    count = 1

    task "hello" {
      driver = "docker"

      config {
        image = "hello-devops:latest"
        command = "python"
        args = ["hello.py"]
      }

      resources {
        cpu    = 100
        memory = 128
      }

      restart {
        attempts = 0
        mode     = "fail"
      }
    }
  }
}