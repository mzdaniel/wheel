Linux python wheels
===================

This is an intermediate project that simplifies the temporary lack of linux
python wheels on Pypi. In particular, these wheels can be used to simplify
some of the `sphinxserve`_ dependencies avoiding the need of the usual
C toolchain and required package compilation.

Wheels provided
===============

* gevent:    http://gevent.org
* greenlet:  http://github.com/python-greenlet/greenlet


Installation
============

pip installation as simple as::

    $ RAWGITHUB="https://github.com/mzdaniel/wheel/raw/master"
    $ pip install $RAWGITHUB/greenlet-0.4.7-cp27-none-linux_x86_64.whl


Building
========

The wheel files were built within a docker container (using this
`Dockerfile`_) and extracted to be included in this repo with the following
commands::

    git clone https://github.com/mzdaniel/wheel
    cd wheel
    docker build -t wheel .

    WHEEL=gevent-1.1a3.dev0-cp34-cp34m-linux_x86_64.whl
    docker run wheel sh -c "cat /tmp/gevent/dist/$WHEEL" > $WHEEL


.. _sphinxserve: https://github.com/mzdaniel/sphinxserve
.. _Dockerfile: https://github.com/mzdaniel/wheel/blob/master/Dockerfile
