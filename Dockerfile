# DESCRIPTION:  Python wheels
# AUTHOR:       Daniel Mizyrycki <mzdaniel@glidelink.net>
#
# TO BUILD:     git clone https://github.com/mzdaniel/wheel
#               cd wheel
#               docker build -t wheel .
#
# TO EXTRACT:   GEVENT=gevent-1.1b1-cp27-none-linux_x86_64.whl
#               GREENLET=greenlet-0.4.7-cp27-none-linux_x86_64.whl
#               docker run wheel sh -c "cat /pkg/$GEVENT" > $GEVENT
#               docker run wheel sh -c "cat /pkg/$GREENLET" > $GREENLET

FROM base/archlinux

# Build wheels
RUN  \
    mkdir /pkg && \
    echo "Server = http://repo.gdl/mirror.rackspace.com/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist && \
    pacman -Syu --noconfirm; pacman-key --refresh-keys && \
    pacman -S --noconfirm curl openssl libunistring base-devel cython cython2 \
        git && \
    pacman-db-upgrade && \
    curl https://bootstrap.pypa.io/get-pip.py | python2 && \
    curl https://bootstrap.pypa.io/get-pip.py | python && \
    pip2 install wheel && \
    pip install wheel && \
    pip2 wheel gevent==1.1b1 && \
    pip wheel gevent==1.1b1 && \
    mv wheelhouse/* /pkg

CMD ["/bin/bash"]
