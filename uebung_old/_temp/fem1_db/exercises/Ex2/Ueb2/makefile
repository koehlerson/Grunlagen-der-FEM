OBJECTS = gausspiv.o fdm2d1.o

fdm2d1: $(OBJECTS) makefile
	g77 -o fdm2d1 $(OBJECTS)  

.f.o:
	g77 -g -c $*.f
