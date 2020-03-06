#!/bin/bash

if [ -d "$CERT_MANAGER_DIRECTORY" -a -d "$HAZELCAST_HOME" ]; then
  openssl pkcs12 -export \
    -out "$HAZELCAST_HOME/tls.p12.new" \
    -name member1 \
    -inkey "$CERT_MANAGER_DIRECTORY/tls.key" \
    -in "$CERT_MANAGER_DIRECTORY/tls.crt" \
    -certfile "$CERT_MANAGER_DIRECTORY/ca.crt" \
    -passout pass:123456
  keytool -importcert -trustcacerts -noprompt \
    -alias ca \
    -file "$CERT_MANAGER_DIRECTORY/ca.crt" \
    -keystore "$HAZELCAST_HOME/tls.p12.new" \
    -storepass 123456 \
    -keypass 123456 \
    -storetype PKCS12
  mv "$HAZELCAST_HOME/tls.p12.new" "$HAZELCAST_HOME/tls.p12"
fi
