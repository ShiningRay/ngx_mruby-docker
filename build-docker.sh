#!/bin/sh
NGINX_ROOT=/nginx  # nginx installation dir in docker
NGINX_VAR=$NGINX_ROOT/var
NGINX_LOG=$NGINX_VAR/log
NGINX_TMP=$NGINX_VAR/tmp
mkdir -p nginx # create export path at local
NGINX_CONFIG_OPT_ENV="--prefix=$NGINX_ROOT --pid-path=/var/run/nginx --lock-path=/var/lock/nginx --error-log-path=$NGINX_LOG/error.log --http-log-path=$NGINX_LOG/access.log --http-client-body-temp-path=$NGINX_TMP/client_body --http-proxy-temp-path=$NGINX_TMP/proxy --http-fastcgi-temp-path=$NGINX_TMP/fastcgi --http-uwsgi-temp-path=$NGINX_TMP/uwsgi --http-scgi-temp-path=$NGINX_TMP/scgi" # export tmp path to /
docker run -v `pwd`/nginx:$NGINX_ROOT -e "NGINX_CONFIG_OPT_ENV=$NGINX_CONFIG_OPT_ENV" -w /root/ngx_mruby shiningray/ngx_mruby-dev sh build.sh # compile use sdk and export binaries to local dir
docker build -t shiningray/ngx_mruby:latest .  # build docker image and copy binaries to new runtime image
