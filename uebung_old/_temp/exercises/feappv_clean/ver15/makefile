feappv:
	(cd main; make feappv)
	@@echo "--> Feap executable made <--"

archive:   
	(cd program; make archive)
	(cd elements; make archive)
	(cd plot; make archive)
	(cd unix; make archive)
	(cd user; make archive)
	@@echo "--> Feap Archive updated <--"

install:
	(cd program; make install)
	(cd elements; make install)
	(cd plot; make install)
	(cd unix; make install)
	(cd user; make install)
	(cd f77; make install)
#	(cd patch; make install)
#	(cd f90; make install)
	(cd main; make feappv)
	@@echo "--> Feappv Installed <--"
