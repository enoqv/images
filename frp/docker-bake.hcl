variable "FRP_VERSION" {
  default = "0.67.0"
}

target "docker-metadata-action" {}

target "_multi_platforms" {
  platforms = [
    "linux/amd64",
    "linux/arm64"
  ]
}

target "frps" {
  inherits = ["docker-metadata-action", "_multi_platforms"]
  context = "./frp"
  dockerfile = "./frps.dockerfile"
  args = {
    FRP_VERSION = "${FRP_VERSION}"
  }
}

target "frpc" {
  inherits = ["docker-metadata-action", "_multi_platforms"]
  context = "./frp"
  dockerfile = "./frpc.dockerfile"
  args = {
    FRP_VERSION = "${FRP_VERSION}"
  }
}