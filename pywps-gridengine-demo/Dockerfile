# vim:set ft=dockerfile:
# FROM phusion/baseimage
FROM nlesc/xenon-gridengine
MAINTAINER Birdhouse <wps@dkrz.de>

LABEL Description="pywps gridengine demo" Vendor="Birdhouse" Version="0.1.0"

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

# add conda to path
ENV PATH /opt/conda/bin:$PATH

# install debian packages with gridengine drmaa
RUN apt-get install -y gridengine-drmaa1.0 gridengine-drmaa-dev gridengine-client

# Install conda packages for scheduler extension
RUN conda install -y -n emu -c birdhouse -c conda-forge psycopg2 drmaa dill

# change demo user home
RUN usermod -m -d /home/demo www-data && \
  mkdir /home/demo && \
  chown -R www-data /home/demo

# add slurm config
# ADD slurm/slurm.conf /etc/slurm-llnl/slurm.conf

ENV SGE_ROOT /var/lib/gridengine
# ENV DAEMON_OPTS --nodaemon

# copy start script
COPY start-services.sh /etc/start-services.sh

# Start service ...
CMD ["/etc/start-services.sh"]
