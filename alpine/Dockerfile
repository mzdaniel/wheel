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

FROM python:3.12-alpine

# Build wheels
RUN \
    mkdir pkg && \
    apk update && \
    apk add bash curl python3 alpine-sdk python3-dev libffi-dev openssl-dev && \
    curl https://bootstrap.pypa.io/get-pip.py | python && \
    pip install wheel && \
    pip wheel gevent==25.8.2 && \
    mv /*.whl /pkg && \
    apk del curl python3 alpine-sdk python3-dev libffi-dev openssl-dev && \
    rm -rf /var/cache/apk/* /root/.cache /tmp/*;

CMD ["/bin/bash"]
