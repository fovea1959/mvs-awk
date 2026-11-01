#!/bin/bash 

for f in \
	ascii.c \

do	
  FILENAME_NO_EXT=$(basename "$f" .c)
 
  cc370 -c -o ${FILENAME_NO_EXT}.o -DHAVE_CONFIG_H=1 $f 
done

ld370 -xmit -o ascii.out --blocksize 6144 --entry @@CRT0 -L/usr/lib/cc370/cc370/lib -lcc370rt -lc ascii.o
#rm *.o
upload-ld370.py --dsn mvscus.linklib --xmit ascii.out.xmit --out ascii.out.jcl

ncat --send-only -w1 localhost 33506 < ascii.out.jcl

