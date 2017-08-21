# version 2017.05.09
FROM binstar/linux-64
MAINTAINER https://github.com/bird-house/birdhouse-build
LABEL Description="conda build image" Vendor="Birdhouse" Version="0.2.1"
RUN yum update -y 
RUN yum install -y epel-release 
RUN yum install -y wget curl gcc-c++ make tar bzip2 unzip patch
#RUN yum install -y make autoconf libtool gcc-c++
#RUN yum install -y expat-devel texinfo
RUN yum install -y libXrender libXext libX11
#RUN yum install -y libuuid libuuid-devel
RUN useradd binstar
RUN chown binstar:binstar -R /opt/miniconda
USER binstar
WORKDIR /home/binstar
ENV HOME /home/binstar
ENV PATH /opt/miniconda/bin:$PATH
RUN conda update -y conda
RUN conda config --set always_yes true && \
    conda config --set channel_priority true && \
    conda config --add channels defaults && \
    conda config --add channels conda-forge && \
    conda config --add channels birdhouse

RUN conda install conda-build jinja2 psutil anaconda-client anaconda-build llvm mercurial
#RUN binstar config --set sites.binstar.url "https://api.anaconda.org"
CMD ["bash"]
