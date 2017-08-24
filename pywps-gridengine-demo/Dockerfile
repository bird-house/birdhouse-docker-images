# vim:set ft=dockerfile:
FROM birdhouse/emu
MAINTAINER Birdhouse <wps@dkrz.de>

LABEL Description="pywps gridengine demo" Vendor="Birdhouse" Version="0.1.1"

# Add jessie backports repo for gridengine packages
RUN echo "deb http://httpredir.debian.org/debian jessie-backports main contrib non-free" >> /etc/apt/sources.list

# install debian packages with gridengine drmaa
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
  apt-get install -y gridengine-drmaa1.0 gridengine-drmaa-dev gridengine-client

# Install conda packages for scheduler extension
RUN conda install -y -n emu -c birdhouse -c conda-forge psycopg2 drmaa dill

# update emu wps config
ADD custom.cfg /opt/birdhouse/src/emu/custom.cfg

# copy start script
COPY start-services.sh /etc/start-services.sh

# Start service ...
ENTRYPOINT ["/etc/start-services.sh"]
