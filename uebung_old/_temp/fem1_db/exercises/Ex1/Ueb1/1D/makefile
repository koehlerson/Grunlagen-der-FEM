OBJECTS = gausspiv.o fdm1d1.o

fdm1d1: $(OBJECTS) makefile
	g77 -o fdm1d1 $(OBJECTS)  

.f.o:
	g77 -c $*.f
