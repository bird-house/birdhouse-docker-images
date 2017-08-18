#!/usr/bin/env bash
#=============================================================#
#
# This script is included by the Dockerfile.
#
# The script prepares and starts a Slurm service in the
# docker container.
#
#=============================================================#
# keep external environment
set -o allexport

# starting supervisor
supervisord -c /etc/supervisor/supervisord.conf

# start slurm services: slurmctld slurmd
supervisorctl -c /etc/supervisor/supervisord.conf start $@

# loop for ever
sleep infinity
