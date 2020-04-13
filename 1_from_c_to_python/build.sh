#!/bin/bash


DEFAULT_PKG_CONFIG_PATH=$PKG_CONFIG_PATH
PYTHON_PREFIX=`python3-config --prefix`
export PKG_CONFIG_PATH=$PYTHON_PREFIX/lib/pkgconfig/

gcc -shared -o newmath.so `pkg-config --cflags --libs python-3-embed` newmath.c

# Restore PKG CONFIG
export PKG_CONFIG_PATH=$DEFAULT_PKG_CONFIG_PATH
