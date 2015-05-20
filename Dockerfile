FROM gliderlabs/alpine:latest
MAINTAINER ShiningRay
EXPOSE 80 
VOLUME ["/nginx/data"]
RUN apk add -U readline pcre
WORKDIR /nginx/
COPY ./nginx/ /nginx
