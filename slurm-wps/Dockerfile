FROM birdhouse/slurm

MAINTAINER Birdhouse <ehbrecht@dkrz.de>
LABEL Description="Slurm with Emu WPS" Vendor="Birdhouse" Version="0.10.2"

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

# update pywps config
# COPY custom.cfg /etc/pywps.cfg
# ENV PYWPS_CFG=/etc/pywps.cfg

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
