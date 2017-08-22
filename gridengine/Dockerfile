# Used https://github.com/gawbul/docker-sge as inspiration/source
FROM nlesc/xenon-phusion-base
MAINTAINER Birdhouse <wps@dkrz.de>
LABEL Description="gridengine" Vendor="Birdhouse" Version="0.1.0"

ENV DEBIAN_FRONTEND noninteractive

# prepare conda install
RUN apt-get update -y && \
  apt-get install -y curl bzip2

# install conda
RUN curl -LO https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
RUN bash Miniconda2-latest-Linux-x86_64.sh -b -p /opt/conda

# add conda to path
ENV PATH /opt/conda/bin:$PATH

# install supervisor
RUN conda install -y supervisor

# add supervisor config
ADD etc/supervisor /etc/supervisor

# make supervisor dirs
RUN mkdir -p /var/log/supervisor

RUN echo "Package: xserver-xorg*\nPin: release *\nPin-Priority: -1" >> /etc/apt/preferences && \
echo "Package: unity*\nPin: release *\nPin-Priority: -1" >> /etc/apt/preferences && \
echo "Package: gnome*\nPin: release *\nPin-Priority: -1" >> /etc/apt/preferences && \
echo "gridengine-master shared/gridenginemaster string $HOSTNAME" | debconf-set-selections && \
echo "postfix postfix/main_mailer_type  string 'No configuration'" | debconf-set-selections

RUN apt-get install -y gridengine-master gridengine-exec gridengine-client

# config
ENV HOSTNAME gridengine
ENV SGE_ROOT /var/lib/gridengine
ADD etc/gridengine /etc/gridengine/files
WORKDIR /etc/gridengine/files
RUN mkdir host_groups exec_hosts && \
# Ignore domains
perl -pi -e 's/false/true/' /var/lib/gridengine/default/common/bootstrap && \
echo $HOSTNAME > /var/lib/gridengine/default/common/act_qmaster && \
/etc/init.d/gridengine-master start && sleep 2 && \
# submit host
qconf -as $HOSTNAME && \
# hosts for queues
/bin/echo -e "group_name @allhosts\nhostlist $HOSTNAME" > host_groups/allhosts && \
qconf -Ahgrp host_groups/allhosts && \
qconf -Ap parallel_environments/bi && \
qconf -Ap parallel_environments/fillup && \
qconf -Ap parallel_environments/round && \
qconf -Ap parallel_environments/smp && \
qconf -Aq queues/default && \
qconf -Aq queues/slow && \
qconf -Msconf scheduler && \
qconf -Mconf configurations/global && \
killall sge_qmaster

# copy start script
ADD start-services.sh /etc/start-services.sh
RUN chmod +x /etc/start-services.sh

# Expose ge qmaster
EXPOSE 6444
# Expose ge execd
EXPOSE 6445

# Start service ...
ENTRYPOINT ["/etc/start-services.sh"]
CMD ["gridengine-master", "gridengine-exec"]
