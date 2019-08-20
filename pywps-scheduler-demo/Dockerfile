# vim:set ft=dockerfile:
FROM conda/miniconda3:latest
MAINTAINER Birdhouse <ehbrecht@dkrz.de>

LABEL Description="pywps scheduler demo" Vendor="Birdhouse" Version="0.10.2"

# install debian packages with slurm drmaa
RUN apt-get update && \
  apt-get install -y \
          software-properties-common \
          build-essential \
          vim \
          unzip \
          curl \
          wget \
          git \
          slurm-drmaa1 slurm-drmaa-dev slurm-llnl

# update conda
RUN conda update -y conda && \
  conda install -y -c conda-forge pip python=3.6 netCDF4 xarray psycopg2 drmaa

# init bash for conda
RUN conda init bash

# clone emu wps
WORKDIR /opt
RUN git clone https://github.com/bird-house/emu.git wps

# install emu
WORKDIR /opt/wps
RUN pip install -e .

# Update to latest pywps
RUN pip install --upgrade git+https://github.com/cehbrecht/pywps.git@pingudev

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# add slurm config
COPY slurm/slurm.conf /etc/slurm-llnl/slurm.conf

# update pywps config
COPY custom.cfg /etc/pywps.cfg
ENV PYWPS_CFG=/etc/pywps.cfg

# create data volume
RUN mkdir /data

# Start WPS service on port 5000 on 0.0.0.0
EXPOSE 5000
ENTRYPOINT ["/bin/bash", "-c"]
CMD ["emu start -b 0.0.0.0 -c /etc/pywps.cfg"]
