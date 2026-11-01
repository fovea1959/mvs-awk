#!/bin/bash 

for f in \
	b.c \
	lex.c \
	lib.c \
	main.c \
	maketab.c \
	parse.c \
	proctab.c \
	run.c \
	tran.c \
	ytab.c \

do	
  FILENAME_NO_EXT=$(basename "$f" .c)
 
  cc370 -c -o ${FILENAME_NO_EXT}.o -DHAVE_CONFIG_H=1 $f 
done

ld370 -xmit -o awk.out --blocksize 6144 --entry @@CRT0 -L/usr/lib/cc370/cc370/lib -lcc370rt -lc *.o
#rm *.o
#upload-ld370.py --dsn mvscus.linklib --xmit sed.out.xmit --out sed.out.jcl

#ncat --send-only -w1 localhost 33506 < sed.out.jcl

