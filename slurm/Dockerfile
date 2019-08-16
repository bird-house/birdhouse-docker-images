# vim:set ft=dockerfile:
FROM conda/miniconda3:latest
MAINTAINER Birdhouse <ehbrecht@dkrz.de>
LABEL Description="Slurm" Vendor="Birdhouse" Version="0.10.0"

# install debian packages
RUN apt-get update && \
  apt-get install -y \
          software-properties-common \
          build-essential \
          vim \
          unzip \
          curl \
          wget \
          git

# install ansible
RUN apt-add-repository -y 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' && \
  apt-get update -y  && \
  apt-get install -y --allow-unauthenticated ansible

# get ansible script
WORKDIR /opt
RUN git clone https://github.com/bird-house/birdhouse-ansible.git

# run ansible
WORKDIR /opt/birdhouse-ansible/slurm
RUN ansible-playbook -c local -e slurm_server_name=slurm playbook.yml

# copy start script
COPY start-services.sh /etc/start-services.sh
RUN chmod +x /etc/start-services.sh

# ports
EXPOSE 6817 6818

# Start service ...
ENTRYPOINT ["/etc/start-services.sh"]
CMD ["slurmctld", "slurmd"]
