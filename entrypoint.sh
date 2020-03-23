#!/bin/bash

set -euo pipefail

[[ -n $@ ]] && exec "$@"

[[ -z $PSK ]] && PSK=$(head -c 12 /dev/urandom|base64)

cat <<EOF | tee snell.conf
[snell-server]
listen = 0.0.0.0:${PORT}
psk = ${PSK}
obfs = ${OBFS}
EOF

exec snell-server -c snell.conf ${ARGS}
