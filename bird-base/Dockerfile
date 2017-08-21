FROM continuumio/miniconda
MAINTAINER https://github.com/bird-house/birdhouse-build

LABEL Description="Birdhouse base image" Vendor="Birdhouse" Version="0.2.3"

# Install common debian packages
RUN apt-get update && apt-get install -y sudo wget curl build-essential unzip

# add conda channels
RUN conda config --set channel_priority true && \
conda config --add channels defaults && \
conda config --append channels birdhouse

# Install conda packages
RUN conda update -y conda && conda install -y python=2.7 openssl curl mako
