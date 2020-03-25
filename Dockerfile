FROM alpine:edge AS builder
RUN apk add zip wget
ENV VERSION=2.0.0 _VERSION=2.0.0b10
RUN wget -nv https://github.com/surge-networks/snell/releases/download/${_VERSION}/snell-server-v${VERSION}-b10-linux-amd64.zip && unzip snell-server-*.zip

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
