
FROM alpine:3.21 AS certs
RUN apk add --no-cache ca-certificates

FROM bluenviron/mediamtx:1.19.2

COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt

COPY mediamtx.yml /mediamtx.yml
