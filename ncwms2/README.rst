**********************
ncwms2 Web Map Service
**********************

Install with Buildout
*********************


Install ncWMS2/tomcat with default options:

.. code-block:: sh

   $ make install
   $ make start

Change default options:

.. code-block:: sh

  $ vim custom.cfg
  $ make update
  $ make restart


Build Docker
************

Build docker image::

  $ docker-compose build

Start docker::

  $ docker-compose up
