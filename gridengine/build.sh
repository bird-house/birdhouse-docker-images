#!/bin/bash
docker build --rm --add-host "gridengine:127.0.0.1" --add-host "wps:127.0.0.1" --add-host "gridengine-wps:127.0.0.1" -t birdhouse/gridengine .
