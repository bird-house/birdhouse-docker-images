#!/bin/bash
docker build --rm \
  --add-host "gridengine:127.0.0.1" \
  -t birdhouse/gridengine .
