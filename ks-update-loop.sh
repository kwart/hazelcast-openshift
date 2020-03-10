#!/bin/bash

PRGDIR=`dirname "$0"`

if [ ! -d "$CERT_MANAGER_DIRECTORY" ]; then
  exit 1
fi

while true; do
  "$PRGDIR/update-keystore.sh"
   sleep 60
done
