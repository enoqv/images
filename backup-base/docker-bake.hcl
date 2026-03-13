target "docker-metadata-action" {}

target "_multi_platforms" {
  platforms = [
    "linux/amd64"
  ]
}

target "backup-base" {
  inherits = ["docker-metadata-action", "_multi_platforms"]
  context = "./backup-base"
  dockerfile = "./Dockerfile"
}