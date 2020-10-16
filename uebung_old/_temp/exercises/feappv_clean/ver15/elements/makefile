include ../makefile.in

SOURCES = $(FSOURCE)*.$(FEXT)

archive: $(SOURCES)
	$(AR) $(ARFEAP) $%
	@@echo "--->ELEMENTS objects now up-to-date<---"
	rm -f $% *.o
install: $(SOURCES)
	$(FF) -c -I$(FINCLUDE) $(FFOPTFLAG) *.f
	$(AR) $(ARFEAP) *.o
	@@echo "--->ELEMENTS objects now installed in archive<---"
	rm -f $% *.o

.f.o:
	$(FF) -c -I$(FINCLUDE) $(FFOPTFLAG) *.f -o $*.o

.c.o:
	$(CC) -c $(CCOPTFLAG) *.c -o $*.o
