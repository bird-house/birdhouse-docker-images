# vim:set ft=dockerfile:
# FROM phusion/baseimage
FROM birdhouse/gridengine
MAINTAINER Birdhouse <wps@dkrz.de>

LABEL Description="pywps gridengine demo" Vendor="Birdhouse" Version="0.1.0"

# Install client part
RUN conda install -y -c birdhouse -c conda-forge emu pywps=4 dill psycopg2 gunicorn=19.7

# change demo user home
RUN usermod -m -d /home/demo www-data && \
  mkdir /home/demo && \
  chown -R www-data /home/demo
