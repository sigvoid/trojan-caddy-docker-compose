#!/bin/sh

set -e

until [ `ls -A /ssl|wc -w` -ne 0 ]
do
  >&2 echo "ssl certs is empty - checking..."
  sleep 1
done

exec $@