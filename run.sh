#!/bin/bash

docker run --name postgis-acl -p 0.0.0.0:15432:5432 -e POSTGRE_PASSWORD=123456 -d postgis-acl

