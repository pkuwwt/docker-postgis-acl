FROM mdillon/postgis:9.5-alpine
MAINTAINER pkuwwt <wwthunan@gmail.com>

RUN apk add --no-cache --virtual .build-deps \
        autoconf \
        automake \
        g++ \
        json-c-dev \
        libtool \
        libxml2-dev \
        make \
        perl

ADD acl /usr/src/acl

RUN cd /usr/src/acl \
	   && make \
	   && make install

#RUN apk del .fetch-deps .build-deps .build-deps-edge

COPY ./initdb-acl.sh /docker-entrypoint-initdb.d/acl.sh
