variable "JUICEFS_VERSION" {
  default = "1.3.1"
}

target "docker-metadata-action" {}

target "_multi_platforms" {
  platforms = [
    "linux/amd64"
  ]
}

target "juicefs" {
  inherits = ["docker-metadata-action", "_multi_platforms"]
  context = "./juicefs"
  dockerfile = "./Dockerfile"
  args = {
    JUICEFS_VERSION = "${JUICEFS_VERSION}"
  }
}