#!/bin/bash 

for f in \
	t123.c \

do	
  FILENAME_NO_EXT=$(basename "$f" .c)
 
  cc370 -c -o ${FILENAME_NO_EXT}.o -DHAVE_CONFIG_H=1 $f 
done

ld370 -xmit -o t123.out --blocksize 6144 --entry @@CRT0 -L/usr/lib/cc370/cc370/lib -lcc370rt -lc t123.o
#rm *.o
upload-ld370.py --dsn mvscus.linklib --xmit t123.out.xmit --out t123.out.jcl

ncat --send-only -w1 localhost 33506 < t123.out.jcl

