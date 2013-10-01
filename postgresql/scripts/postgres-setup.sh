#!/bin/bash
unset CDPATH
source /root/postgres-setup.sh.conf

if [ -z "$PGSQL_PASS" ]; then
  echo FAILURE: you need to configure a Postgres password
  exit 1
fi

if [ -z "$PGSQL_USER" ]; then
  echo FAILURE: you need to configure a Postgres superuser
  exit 1
fi

echo Creating test user "$PGSQL_USER" where password = "$PGSQL_PASS"
(echo $PGSQL_PASS; echo $PGSQL_PASS) | su postgres -c "createuser -P -d -r -s $PGSQL_USER"
echo Creating test database $PGSQL_USER
su postgres -c "createdb -O $PGSQL_USER $PGSQL_USER"
