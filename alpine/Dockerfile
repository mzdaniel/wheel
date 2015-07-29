# DESCRIPTION:  Python wheels
# AUTHOR:       Daniel Mizyrycki <mzdaniel@glidelink.net>
#
# TO BUILD:     git clone https://github.com/mzdaniel/wheel
#               cd wheel/alpine
#               docker build -t wheel .
#
# TO EXTRACT:   GEVENT=gevent-1.1b1-cp27-none-linux_x86_64.whl
#               GREENLET=greenlet-0.4.7-cp27-none-linux_x86_64.whl
#               docker run wheel sh -c "cat /pkg/$GEVENT" > $GEVENT
#               docker run wheel sh -c "cat /pkg/$GREENLET" > $GREENLET

FROM alpine

# Build wheels
RUN \
    mkdir pkg && \
    apk update && \
    apk add bash curl python alpine-sdk python-dev libffi-dev openssl-dev && \
    curl https://bootstrap.pypa.io/get-pip.py | python && \
    pip install wheel && \
    pip wheel gevent==1.1b1 && \
    mv /wheelhouse/* /pkg && \
    apk del curl alpine-sdk python-dev libffi-dev openssl-dev && \
    rm -rf /var/cache/apk/* /root/.cache /tmp/* && \
    find /usr/lib/python2.7 -name '*pyo' -exec rm {} \;

CMD ["/bin/bash"]
