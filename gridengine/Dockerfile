FROM continuumio/miniconda
MAINTAINER Birdhouse <wps@dkrz.de>
LABEL Description="gridengine" Vendor="Birdhouse" Version="0.1.11"

# Add jessie backports repo
RUN echo "deb http://httpredir.debian.org/debian jessie-backports main contrib non-free" >> /etc/apt/sources.list

#ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update

# install ansible with conda
RUN git clone https://github.com/bird-house/birdhouse-ansible.git /opt/ansible

# install ansible
RUN conda install -y -c conda-forge ansible

# install gridengine via ansible
WORKDIR /opt/ansible/gridengine

# install gridengine master
RUN ansible-playbook \
  -e sge_server_name=gridengine \
  playbooks/gridengine.yml

# install gridengine worker
RUN ansible-playbook \
  -e sge_server_name=gridengine \
  -e sge_type_of_node=wn \
  playbooks/gridengine.yml

# config
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
