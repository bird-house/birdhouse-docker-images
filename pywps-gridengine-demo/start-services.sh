#!/usr/bin/env bash
#=============================================================#
#
# This script is included by the Dockerfile.
#
# The script prepares and starts a WPS service in the
# docker container.
#
#=============================================================#
# keep external environment
set -o allexport
# fix config
echo "fix permissions"
chown -R wps /opt/birdhouse/var/lib
chown -R wps /opt/birdhouse/var/log
#chown -R wps /opt/birdhouse/var/run
rm -rf /opt/birdhouse/var/run && mkdir -p /opt/birdhouse/var/run
# update the wps config (customized by environment variables)
make update-config
# start supervisor service with wps and nginx
make start
