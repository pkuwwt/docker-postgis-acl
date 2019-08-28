#!/bin/bash

cd `dirname $(readlink -f $0)`
git clone https://github.com/arkhipov/acl.git
docker build -t postgis-acl .

