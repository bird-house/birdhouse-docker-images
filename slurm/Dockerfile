FROM continuumio/miniconda

MAINTAINER Birdhouse <wps@dkrz.de>
LABEL Description="Slurm" Vendor="Birdhouse" Version="0.7.5"

# install sudo
RUN apt-get update && \
  apt-get install -y sudo

# get ansible
WORKDIR /opt
RUN git clone https://github.com/bird-house/birdhouse-ansible.git

# bootstrap ansible
WORKDIR /opt/birdhouse-ansible
RUN bash bootstrap.sh

# run ansible
WORKDIR /opt/birdhouse-ansible/slurm
RUN ansible-playbook -e slurm_server_name=slurm playbooks/slurm.yml

# copy start script
ADD start-services.sh /etc/start-services.sh
RUN chmod +x /etc/start-services.sh

# ports
EXPOSE 6817 6818

# Start service ...
ENTRYPOINT ["/etc/start-services.sh"]
CMD ["slurmctld", "slurmd"]
