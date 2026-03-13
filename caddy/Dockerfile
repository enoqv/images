ARG CADDY_VERSION

FROM library/caddy:${CADDY_VERSION}-builder AS builder
RUN xcaddy build --with github.com/caddy-dns/cloudflare \
 --with github.com/enoqv/caddy-l4@my-custom

FROM caddy:${CADDY_VERSION}-alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy