include ../makefile.in

SOURCES = $(FSOURCE)*.$(FEXT)

archive: $(SOURCES)
	$(AR) $(ARFEAP) $%
	@@echo "--->UNIX objects now up-to-date<---"
	rm -f $% *.o

install: $(SOURCES)
	$(FF) -c -I$(FINCLUDE) $(FFOPTFLAG) *.f
	$(CC) -c $(CCOPTFLAG) *.c
	$(AR) $(ARFEAP) *.o
	@@echo "--->UNIX objects now installed in archive<---"
	rm -f $% *.o

.f.o:
	$(FF) -c -I$(FINCLUDE) $(FFOPTFLAG) *.f -o $*.o

.c.o:
	$(CC) -c $(CCOPTFLAG) *.c -o $*.o

