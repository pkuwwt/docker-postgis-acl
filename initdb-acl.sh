#!/bin/sh

set -e

# Perform all actions as $POSTGRES_USER
export PGUSER="$POSTGRES_USER"

# Create the 'template_acl' template db
"${psql[@]}" <<- 'EOSQL'
CREATE DATABASE template_acl;
UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'template_acl';
EOSQL

# Load ACL into both template_database and $POSTGRES_DB
for DB in template_acl "$POSTGRES_DB"; do
	echo "Loading ACL extensions into $DB"
	"${psql[@]}" --dbname="$DB" <<-'EOSQL'
		CREATE EXTENSION IF NOT EXISTS acl;
EOSQL
done
