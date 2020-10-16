include ../makefile.in

OBJECTS = feappv.o

SOURCES = $(FSOURCE)feappv.$(FEXT)

feappv: $(OBJECTS) $(SOURCES) $(ARFEAP)
	$(FF) -o feappv $(OBJECTS) $(ARFEAP) $(LDOPTIONS)

.f.o:
	$(FF) -c $(FFOPTFLAG) -I$(FINCLUDE) *.f

.c.o:
	$(CC) -c $(CCOPTFLAG)  *.c

