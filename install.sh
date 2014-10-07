#!/bin/bash

# configs
GOOGLE_HOST=mygoogle.example.com
GOOGLE_SSL_CRT=/etc/nginx/certs/my.crt
GOOGLE_SSL_KEY=/etc/nginx/certs/my.key

SCRIPTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GEN=$SCRIPTDIR/generated

mkdir -p $GEN

sed \
  -e "s#{{HOST}}#$GOOGLE_HOST#g" \
  -e "s#{{SSL_CRT}}#$GOOGLE_SSL_CRT#g" \
  -e "s#{{SSL_KEY}}#$GOOGLE_SSL_KEY#g" \
  $SCRIPTDIR/google.conf > $GEN/google.conf
