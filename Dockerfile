FROM alpine:edge AS builder
RUN apk add zip wget
ENV VERSION=2.0.0 BETA_VERSION=b12
RUN wget -nv https://github.com/surge-networks/snell/releases/download/${VERSION}${BETA_VERSION}/snell-server-v${VERSION}-${BETA_VERSION}-linux-amd64.zip && unzip snell-server-*.zip

FROM debian:stable-slim
LABEL maintainer "Jian Zeng <zengjian@iftech.io>"
ENV PORT 8388
ENV OBFS http
ENV PSK=
ENV ARGS=

EXPOSE ${PORT}/tcp
EXPOSE ${PORT}/udp

COPY --from=builder /snell-server /usr/local/bin/snell-server
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
CMD ["entrypoint.sh"]
