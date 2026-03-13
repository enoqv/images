FROM alpine:3.23.3

# Install the tzdata package
RUN apk add --no-cache tzdata

# Set the Timezone environment variable to your desired location (e.g., America/New_York)
ENV TZ=UTC

# Install required packages (removed duplicate entries)
RUN apk add --no-cache \
    tini \
    bash \
    curl \
    jq \
    openssh \
    tar \
    gzip \
    bzip2 \
    xz \
    zip \
    unzip \
    restic \
    postgresql18-client \
    supercronic

ENV DOCKERIZE_VERSION=0.10.1
RUN wget -nv -O - "https://github.com/jwilder/dockerize/releases/download/v${DOCKERIZE_VERSION}/dockerize-alpine-linux-amd64-v${DOCKERIZE_VERSION}.tar.gz" | tar -xz -C /usr/local/bin/ -f -

# Create a non-root user and group (UID/GID 1000) with home directory
RUN addgroup -g 1000 backupgroup && \
    adduser -u 1000 -G backupgroup -D -h /home/backupuser backupuser

# Set working directory and ownership
WORKDIR /home/backupuser
RUN chown -R backupuser:backupgroup /home/backupuser

# Switch to the non-root user
USER backupuser

ENTRYPOINT ["/sbin/tini", "-v", "--"]