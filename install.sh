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

APPLEDAILYHK_HOST=myappledaily.example.com
APPLEDAILYHK_CRT=/etc/nginx/certs/ad.crt
APPLEDAILYHK_KEY=/etc/nginx/certs/ad.key

T66Y_HOST=myty.example.com
T66Y_CRT=/etc/nginx/certs/ty.crt
T66Y_KEY=/etc/nginx/certs/ty.key

FACEBOOK_HOST=f.example.com
FACEBOOK_CRT=/etc/nginx/certs/fb.crt
FACEBOOK_KEY=/etc/nginx/certs/fb.key
FACEBOOK_AUTH_FILE=/home/example/facebook.passwd
FACEBOOK_COOKIE="copy-from-chrome"

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

sed \
  -e "s#{{HOST}}#$APPLEDAILYHK_HOST#g" \
  -e "s#{{SSL_CRT}}#$APPLEDAILYHK_CRT#g" \
  -e "s#{{SSL_KEY}}#$APPLEDAILYHK_KEY#g" \
  $SCRIPTDIR/appledailyhk.conf > $GEN/appledailyhk.conf

sed \
  -e "s#{{HOST}}#$T66Y_HOST#g" \
  -e "s#{{SSL_CRT}}#$T66Y_CRT#g" \
  -e "s#{{SSL_KEY}}#$T66Y_KEY#g" \
  $SCRIPTDIR/t66y.conf > $GEN/t66y.conf

sed \
  -e "s#{{HOST}}#$FACEBOOK_HOST#g" \
  -e "s#{{SSL_CRT}}#$FACEBOOK_CRT#g" \
  -e "s#{{SSL_KEY}}#$FACEBOOK_KEY#g" \
  -e "s#{{AUTH_FILE}}#$FACEBOOK_AUTH_FILE#g" \
  -e "s#{{COOKIE}}#$FACEBOOK_COOKIE#g" \
  $SCRIPTDIR/facebook.conf > $GEN/facebook.conf
