# docker base image for the birds

build image:

    $ docker build --rm=true -t birdhouse/bird-base .

upload image:

    $ docker push birdhouse/bird-base

run image:

    $ docker run --rm -i -t birdhouse/bird-base /bin/bash

