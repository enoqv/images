variable "CADDY_VERSION" {
  default = "2.10.2"
}

target "docker-metadata-action" {}

target "_multi_platforms" {
  platforms = [
    "linux/amd64"
  ]
}

target "caddy" {
  inherits = ["docker-metadata-action", "_multi_platforms"]
  context = "./caddy"
  dockerfile = "./Dockerfile"
  args = {
    CADDY_VERSION = "${CADDY_VERSION}"
  }
}