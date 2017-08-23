FROM nlesc/xenon-phusion-base
MAINTAINER Birdhouse <wps@dkrz.de>
LABEL Description="gridengine" Vendor="Birdhouse" Version="0.1.8"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y && \
  apt-get install -y git python

# install ansible with conda
WORKDIR /root
RUN git clone https://github.com/bird-house/birdhouse-ansible.git
WORKDIR /root/birdhouse-ansible
# RUN git checkout develop
RUN bash bootstrap.sh

# add conda to path
ENV PATH /opt/conda/bin:$PATH

# install gridengine via ansible
WORKDIR /root/birdhouse-ansible/gridengine
RUN ansible-playbook -e sge_server_name=gridengine playbooks/gridengine.yml

# config
ENV HOSTNAME gridengine
ENV SGE_ROOT /var/lib/gridengine

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
