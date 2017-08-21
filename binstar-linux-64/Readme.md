# docker image for binstar/conda builds

build image:

    $ docker build -t birdhouse/binstar-linux-64 .


upload image:

    $ docker push birdhouse/binstar-linux-64

run image:

    $ docker run --rm -i -t birdhouse/binstar-linux-64

use image to build conda package:

    $ docker run --rm -i -t -v ~/sandbox/birdhouse/conda-recipes:/home/binstar/conda-recipes birdhouse/binstar-linux-64
    $ conda config --add channels birdhouse
    $ conda build conda-recipes/owslib
    $ anaconda login
    $ anaconda upload -u birdhouse -c dev ...
