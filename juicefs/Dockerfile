FROM golang:1.25 AS builder

ARG JUICEFS_VERSION

WORKDIR /app

# Clone juicefs at the specified version (shallow clone for speed)
RUN git clone --branch v${JUICEFS_VERSION} --depth 1 https://github.com/juicedata/juicefs.git .

RUN make

FROM alpine:3.23

# Install runtime dependencies (ca-certificates for HTTPS, fuse3 for mounting)
RUN apk add --no-cache ca-certificates fuse3

COPY --from=builder /app/juicefs /usr/local/bin/juicefs

ENTRYPOINT ["juicefs"]
