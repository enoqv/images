target "docker-metadata-action" {}

target "_multi_platforms" {
  platforms = [
    "linux/amd64"
  ]
}

target "airflow" {
  inherits = ["docker-metadata-action", "_multi_platforms"]
  # Build context and Dockerfile live under ./airflow from repo root
  context = "./airflow"
  dockerfile = "./Dockerfile"
}