#!/bin/bash

CFLAGS=$(pkg-config --cflags glib-2.0 fuse)

gcc -x c -c -fPIC -o definitions.o -D_FILE_OFFSET_BITS=64 $CFLAGS definitions.c
gcc -x c -c -fPIC -o adaptor.o -D_FILE_OFFSET_BITS=64 $CFLAGS adaptor.c

gcc -shared -fPIC -o libAdaptor.dylib -L /usr/local/lib/ -l fuse definitions.o adaptor.o -lc

