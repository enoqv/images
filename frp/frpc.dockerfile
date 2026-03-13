FROM --platform=$BUILDPLATFORM debian:bookworm-slim AS builder

ARG FRP_VERSION
ARG TARGETOS
ARG TARGETARCH

# Install tools required to download and extract frp
RUN apt-get update && apt-get install -y curl tar

# Download the specified frp release
RUN curl -LO "https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_${TARGETOS}_${TARGETARCH}.tar.gz"

# Extract the downloaded archive
RUN tar -xzf "frp_${FRP_VERSION}_${TARGETOS}_${TARGETARCH}.tar.gz"

FROM debian:bookworm-slim

# Application working directory
WORKDIR /app

# Re-declare build args for this stage
ARG FRP_VERSION
ARG TARGETOS
ARG TARGETARCH

# Copy frpc binary from the builder stage
COPY --from=builder /frp_${FRP_VERSION}_${TARGETOS}_${TARGETARCH}/frpc /app/frpc

# Ensure the binary is executable
RUN chmod +x /app/frpc

# Default command
CMD ["/app/frpc", "-c", "/app/frpc.toml"]
