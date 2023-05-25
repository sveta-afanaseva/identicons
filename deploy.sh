#!/bin/bash
set -e

echo "Starting identicons system"

docker run -d --restart=always --name redis redis:3
docker run -d --restart=always --name dnmonster amouat/dnmonster:1.0
docker run -d --restart=always --link dnmonster:dnmonster --link redis:redis \
-e ENV=PROD --name identicons sunnybluemoon/identicons:0.1

echo "Started"