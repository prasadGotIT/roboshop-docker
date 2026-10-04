#!/bin/bash

if [ -f /tmp/mysql-root-password.txt]; then
   PASSWORD=$(cat /tmp/mysql-root-password.txt)
   echo "Accessed MySql root password"
else
    echo "MySql Root password file not found"
    exit 1
fi
export MYSQL_ROOT_$PASSWORD
rm -rf /tmp/mysql-root-password.txt
exec /entrypoint.sh mysqld