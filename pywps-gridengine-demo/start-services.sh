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
# update the wps config (customized by environment variables)
make update-config
# fix config
echo "fix permissions"
chown -R wps /opt/birdhouse/var/lib
chown -R wps /opt/birdhouse/var/log
chown -R wps /opt/birdhouse/var/run
# start supervisor service with wps and nginx
make start
