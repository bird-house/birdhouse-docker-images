Slurm docker container with Emu WPS
===================================

The docker image contains a Slurm scheduler and a PyWPS demo (Emu)
installed via conda.

How to use this image
---------------------

Run the container::

  $ docker run -h slurm -p 6817:6817 -p 6818:6818 --rm birdhouse/slurm-wps

How to build the image
-----------------------

Build from this directory using the enclosed Dockerfile::

  $ docker build --rm -t birdhouse/slurm-wps .
