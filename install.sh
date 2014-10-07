#!/bin/bash

# configs
GOOGLE_HOST=mygoogle.example.com
GOOGLE_SSL_CRT=/etc/nginx/certs/my.crt
GOOGLE_SSL_KEY=/etc/nginx/certs/my.key

TWITTER_HOST=mytwitter.example.com
TWITTER_SSL_CRT=/etc/nginx/certs/tw.crt
TWITTER_SSL_KEY=/etc/nginx/certs/tw.key

BLOGGER_HOST=myblogger.example.com
BLOGGER=googleblog.blogspot.com

SCRIPTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GEN=$SCRIPTDIR/generated

mkdir -p $GEN

sed \
  -e "s#{{HOST}}#$GOOGLE_HOST#g" \
  -e "s#{{SSL_CRT}}#$GOOGLE_SSL_CRT#g" \
  -e "s#{{SSL_KEY}}#$GOOGLE_SSL_KEY#g" \
  $SCRIPTDIR/google.conf > $GEN/google.conf

sed \
  -e "s#{{HOST}}#$TWITTER_HOST#g" \
  -e "s#{{SSL_CRT}}#$TWITTER_SSL_CRT#g" \
  -e "s#{{SSL_KEY}}#$TWITTER_SSL_KEY#g" \
  $SCRIPTDIR/twitter.conf > $GEN/twitter.conf

sed \
  -e "s#{{HOST}}#$BLOGGER_HOST#g" \
  -e "s#{{BLOGGER}}#$BLOGGER#g" \
  $SCRIPTDIR/blogger.conf > $GEN/blogger.conf
