# vim:set ft=dockerfile:
# FROM phusion/baseimage
FROM nlesc/xenon-gridengine
MAINTAINER Birdhouse <wps@dkrz.de>

LABEL Description="pywps gridengine demo" Vendor="Birdhouse" Version="0.1.0"

# Install client part
RUN conda install -y -c birdhouse -c conda-forge emu pywps=4 dill psycopg2 gunicorn=19.7

# change demo user home
RUN usermod -m -d /home/demo www-data && \
  mkdir /home/demo && \
  chown -R www-data /home/demo

ENV SGE_ROOT /var/lib/gridengine

EXPOSE 6444

# copy start script
COPY start-services.sh /etc/start-services.sh

# Start service ...
CMD ["/etc/start-services.sh"]
