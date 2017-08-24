Slurm docker container
======================

This is a development installation of a Slurm scheduler running as a controller and worker.
This image is used as a single node cluster for testing purposes in birdhouse.

How to use this image
---------------------

Run the container::

  $ docker run -h slurm -p 6817:6817 -p 6818:6818 --rm -d birdhouse/slurm

Run the slurm controller only::

  $ docker run -h slurm -p 6817:6817 --rm birdhouse/slurm -d slurmctld

Run the slurm worker only::

  $ docker run -h slurm -p 6818:6818 --rm birdhouse/slurm -d slurmd

Start with docker compose::

  $ docker-compose up

How to build the image
-----------------------

Build from this directory using the enclosed Dockerfile::

  $ docker build --rm -t birdhouse/slurm .

Links
-----

* https://hub.docker.com/r/agaveapi/slurm/
* https://github.com/NLeSC/xenon-docker-images
