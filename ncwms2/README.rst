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

Update Dockerfile:

.. code-block:: sh

  $ make Dockerfile

Build docker image:

.. code-block:: sh

  $ make dockerbuild

Start docker:

.. code-block:: sh

  $ docker-compose up




