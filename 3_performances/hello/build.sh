#!/bin/bash

PYTHON_PREFIX=`python3-config --prefix`
export PKG_CONFIG_PATH=$PYTHON_PREFIX/lib/pkgconfig/

rm *.so
rm *.h
rm *.a

go build -buildmode=c-archive -o libhello.a hello.go

gcc hello.c -shared -o hello.so `pkg-config --cflags --libs python-3-embed` -L . -lhello
