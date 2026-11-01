#!/bin/bash 

P=ascii2

cc370 -c -o ${P}.o -DHAVE_CONFIG_H=1 $P.c

ld370 -xmit -o $P.out --blocksize 6144 --entry @@CRT0 -L/usr/lib/cc370/cc370/lib -lcc370rt -lc $P.o

upload-ld370.py --dsn mvscus.linklib --xmit $P.out.xmit --out $P.out.jcl

ncat --send-only -w1 localhost 33506 < $P.out.jcl

