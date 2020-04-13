#!/bin/bash

PYTHON_PREFIX=`python3-config --prefix`
export PKG_CONFIG_PATH=$PYTHON_PREFIX/lib/pkgconfig/

rm *.so
rm perf.h
rm perf.c

go build -buildmode=c-shared -o perf.so *.go

python pygen.py > perf.c

gcc perf.c -dynamiclib perf.so -o pyperf.so `pkg-config --cflags --libs python-3-embed`
