#!/bin/bash

PYTHON_PREFIX=`python3-config --prefix`
export PKG_CONFIG_PATH=$PYTHON_PREFIX/lib/pkgconfig/

rm *.so
rm *.h
rm *.a

go build -buildmode=c-archive -o libnewmath.a

gcc _newmath.c -shared -o newmath.so `pkg-config --cflags --libs python-3-embed` -L . -lnewmath
