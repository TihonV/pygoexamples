#!/bin/bash

DEFAULT_PKG_CONFIG_PATH=$PKG_CONFIG_PATH
PYTHON_PREFIX=`python3-config --prefix`
export PKG_CONFIG_PATH=$PYTHON_PREFIX/lib/pkgconfig/

go build -buildmode=c-shared -o newmath.so

# Restore PKG CONFIG
DEFAULT_PKG_CONFIG_PATH=$PKG_CONFIG_PATH
