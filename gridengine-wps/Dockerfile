# vim:set ft=dockerfile:
# FROM phusion/baseimage
FROM nlesc/xenon-gridengine
MAINTAINER Birdhouse <wps@dkrz.de>

LABEL Description="pywps gridengine demo" Vendor="Birdhouse" Version="0.1.0"

# prepare conda install
RUN apt-get update -y && \
  apt-get install -y curl bzip2

# install conda
RUN curl -LO https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
RUN bash Miniconda2-latest-Linux-x86_64.sh -b -p /opt/conda

# add conda to path
ENV PATH /opt/conda/bin:$PATH

# Install client part
RUN conda install -y -c birdhouse -c conda-forge emu pywps=4 dill psycopg2 gunicorn=19.7

# change demo user home
RUN usermod -m -d /home/demo www-data && \
  mkdir /home/demo && \
  chown -R www-data /home/demo

ENV SGE_ROOT /var/lib/gridengine

# Start service ...
CMD ["/sbin/my_init"]
