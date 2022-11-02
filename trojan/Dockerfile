FROM golang:alpine3.15 AS builder
WORKDIR /trojan-go
RUN apk add \
        git \
        make \
        gcc \
        g++ \
        libtool \
    && git clone --branch=latest https://github.com/fregie/trojan-go.git \
    && cd trojan-go \
    && make trojan-go

FROM alpine
WORKDIR /config
RUN apk add --no-cache tzdata ca-certificates
COPY --from=builder /trojan-go/trojan-go/build /usr/local/bin/
CMD ["/bin/sh", "/wait_for_caddy.sh", "trojan-go", "-config", "config.json"]
