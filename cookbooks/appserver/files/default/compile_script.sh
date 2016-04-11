#!/bin/sh
cd /tmp
export GOPATH=/tmp
# Compile the code
go build appserver
# Deploy it
mv appserver /usr/local/bin
chown 755 /usr/local/bin/appserver
