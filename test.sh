#!/bin/bash

cd `dirname $(readlink -f $0)`
git clone https://github.com/arkhipov/acl.git
docker cp acl postgis-acl:/tmp/acl
docker exec -it postgis-acl bash -c 'PGUSER=postgres make -C /tmp/acl/ installcheck'

