#!/bin/bash
docker run --rm \
  -v pywpsgridenginedemo_log:/shared/log \
  debian tail -f /shared/log/supervisor/emu.log
