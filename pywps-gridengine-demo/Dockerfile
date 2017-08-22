# vim:set ft=dockerfile:
# FROM phusion/baseimage
FROM birdhouse/gridengine
MAINTAINER Birdhouse <wps@dkrz.de>

LABEL Description="pywps gridengine demo" Vendor="Birdhouse" Version="0.1.1"

USER root
ENV USER root

# install base packages
RUN apt-get update && \
  apt-get install -y git

# install emu wps
WORKDIR /opt
RUN git clone https://github.com/bird-house/emu.git

# update makefile
ADD Makefile.config /opt/emu/Makefile.config

# update emu wps config
ADD custom.cfg /opt/emu/custom.cfg

# run bootstrap
WORKDIR /opt/emu
RUN bash bootstrap.sh -i

# run emu install
RUN make install

# install debian packages with gridengine drmaa
RUN apt-get install -y gridengine-drmaa1.0 gridengine-drmaa-dev gridengine-client

# Install conda packages for scheduler extension
RUN conda install -y -n emu -c birdhouse -c conda-forge psycopg2 drmaa dill

ENV DAEMON_OPTS --nodaemon

# copy start script
COPY start-services.sh /etc/start-services.sh

# Start service ...
CMD ["/etc/start-services.sh"]
