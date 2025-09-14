all: build

build:
    (cd alpine; docker build -t wheel .)
    mkdir -p build
    (export GEVENT=gevent-25.8.2-cp312-cp312-musllinux_1_2_x86_64.whl; cd alpine; docker run wheel sh -c "cat /pkg/$GEVENT" > ../build/$GEVENT)
    (export GREENLET=greenlet-3.2.4-cp312-cp312-musllinux_1_1_x86_64.whl; cd alpine; docker run wheel sh -c "cat /pkg/$GREENLET" > ../build/$GREENLET)
    cp build/gevent*.whl build/gevent-0.0.0.whl
    printf "alpine gevent wheels (2025-09-13)\n=================================\n\nlatest gevent wheels for x86" > build/notes.md
